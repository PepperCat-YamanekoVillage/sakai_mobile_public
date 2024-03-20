// ignore_for_file: constant_identifier_names
// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:core';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sakai_mobile/function/api/get_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/const/pref_key.dart';
import 'package:sakai_mobile/const/cache_policy.dart';
import 'package:sakai_mobile/class/api/resource.dart';

const _PREF_ROOT_KEY = 'siteResourceList';

class ResourceListProvider extends StateNotifier<List<Resource>?> {
  ResourceListProvider(super.state);

  int? _lastRefreshTime;
  String? _siteId;
  Map<String, dynamic>? _localIsNewStateMap;

  Future<void> init(SharedPreferences pref, String siteId) async {
    _siteId = siteId;
    _lastRefreshTime =
        pref.getInt('${_PREF_ROOT_KEY}_${_siteId}_${StorePrefKey.LAST_TIME}');
    _localIsNewStateMap = jsonDecode(pref.getString(
            '${_PREF_ROOT_KEY}_${_siteId}_${StorePrefKey.LOCAL_STATE}') ??
        '{}');
    state = ResourceList.fromJson(jsonDecode(pref.getString(
                '${_PREF_ROOT_KEY}_${_siteId}_${StorePrefKey.API_VALUE}') ??
            '{}'))
        .body;
    _isRefreshing = false;
  }

  /// refresh/forcedRefresh完了前に大量に呼び出されることを避けるため
  bool _isRefreshing = false;

  /// true -> MIN_ACCESS_INTERVAL 待機すること
  Future<bool> refresh(SharedPreferences pref, String domain) async {
    if (_isRefreshing || !(_isInitialized())) return false;
    if (!(_shouldRefresh(pref))) return false;
    pudding('${_PREF_ROOT_KEY}_${_siteId}:refresh');
    _isRefreshing = true;

    final resourceList = await getSiteResourceList(_siteId!, domain);

    if (resourceList != null && resourceList.isNotEmpty) {
      state = resourceList;
    }

    _isRefreshing = false;
    updateLocalState(pref);
    _updateStoreApiValue(pref);
    return true;
  }

  /// true -> MIN_ACCESS_INTERVAL 待機すること
  Future<bool> forcedRefresh(SharedPreferences pref, String domain) async {
    if (_isRefreshing || !(_isInitialized())) return false;
    if (!(_canForcedRefresh(pref))) return false;
    pudding('${_PREF_ROOT_KEY}_${_siteId}:forcedRefresh');
    _isRefreshing = true;

    final resourceList = await getSiteResourceList(_siteId!, domain);

    if (resourceList != null && resourceList.isNotEmpty) {
      state = resourceList;
    }

    _isRefreshing = false;
    updateLocalState(pref);
    _updateStoreApiValue(pref);
    return true;
  }

  Future<void> updateLocalState(SharedPreferences pref) async {
    if (!(_isInitialized())) return;
    if (_localIsNewStateMap == null) return;
    if (state == null) return;
    _localIsNewStateMap!.forEach((key, _) => _localIsNewStateMap![key] = false);

    for (final resource in state!) {
      final String modifiedDate = resource.modifiedDate ?? '';
      if (_localIsNewStateMap![modifiedDate] == null) {
        _localIsNewStateMap![modifiedDate] = true;
      }
    }

    _updateStoreLocalState(pref);
  }

  bool? getLocalState(String? modifiedDate) {
    if (!(_isInitialized())) return null;
    if (_localIsNewStateMap == null) return null;
    return _localIsNewStateMap![modifiedDate ?? ''];
  }

  bool _isInitialized() {
    if (_siteId == null) {
      pudding('Error: Not Initialized');
      return false;
    }
    return true;
  }

  bool _shouldRefresh(SharedPreferences pref) {
    // secondsSinceEpoch
    final nowTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    if (_lastRefreshTime == null ||
        nowTime - _lastRefreshTime! > MaxCacheAge.TEN_MINUTES) {
      _lastRefreshTime = nowTime;
      _updateStoreLastTime(pref);
      return true;
    }
    return false;
  }

  bool _canForcedRefresh(SharedPreferences pref) {
    // secondsSinceEpoch
    final nowTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    if (_lastRefreshTime == null ||
        nowTime - _lastRefreshTime! > MIN_REFRESH_INTERVAL) {
      _lastRefreshTime = nowTime;
      _updateStoreLastTime(pref);
      return true;
    }
    return false;
  }

  Future<void> _updateStoreLastTime(SharedPreferences pref) async {
    if (_lastRefreshTime != null) {
      pref.setInt('${_PREF_ROOT_KEY}_${_siteId}_${StorePrefKey.LAST_TIME}',
          _lastRefreshTime!);
    }
  }

  Future<void> _updateStoreApiValue(SharedPreferences pref) async {
    pref.setString('${_PREF_ROOT_KEY}_${_siteId}_${StorePrefKey.API_VALUE}',
        jsonEncode(ResourceList(body: state).toJson()));
  }

  Future<void> _updateStoreLocalState(SharedPreferences pref) async {
    pref.setString('${_PREF_ROOT_KEY}_${_siteId}_${StorePrefKey.LOCAL_STATE}',
        jsonEncode(_localIsNewStateMap));
  }
}
