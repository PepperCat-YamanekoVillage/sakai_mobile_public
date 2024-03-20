// ignore_for_file: constant_identifier_names
// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:core';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/class/api/assignment.dart';
import 'package:sakai_mobile/const/pref_key.dart';
import 'package:sakai_mobile/const/cache_policy.dart';
import 'package:sakai_mobile/function/api/get_assignment.dart';

const _PREF_ROOT_KEY = 'assignmentList';
const _ALL_SITE_PREF_KEY = '////myAllSites////';

class AssignmentListProvider extends StateNotifier<List<Assignment>?> {
  AssignmentListProvider(super.state);

  int? _lastRefreshTime;
  String? _siteId;

  Future<void> init(SharedPreferences pref, {String? siteId}) async {
    _siteId = (siteId ?? _ALL_SITE_PREF_KEY);
    _lastRefreshTime =
        pref.getInt('${_PREF_ROOT_KEY}_${_siteId}_${StorePrefKey.LAST_TIME}');
    state = AssignmentList.fromJson(jsonDecode(pref.getString(
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

    final assignmentList = (_siteId == _ALL_SITE_PREF_KEY)
        ? await getAssignmentList(domain)
        : await getSiteAssignmentList(_siteId!, domain);

    if (assignmentList != null && assignmentList.isNotEmpty) {
      state = assignmentList;
    }

    _isRefreshing = false;
    _updateStoreApiValue(pref);
    return true;
  }

  /// true -> MIN_ACCESS_INTERVAL 待機すること
  Future<bool> forcedRefresh(SharedPreferences pref, String domain) async {
    if (_isRefreshing || !(_isInitialized())) return false;
    if (!(_canForcedRefresh(pref))) return false;
    pudding('${_PREF_ROOT_KEY}_${_siteId}:forcedRefresh');
    _isRefreshing = true;

    final assignmentList = (_siteId == _ALL_SITE_PREF_KEY)
        ? await getAssignmentList(domain)
        : await getSiteAssignmentList(_siteId!, domain);

    if (assignmentList != null && assignmentList.isNotEmpty) {
      state = assignmentList;
    }

    _isRefreshing = false;
    _updateStoreApiValue(pref);
    return true;
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
        jsonEncode(AssignmentList(body: state).toJson()));
  }
}
