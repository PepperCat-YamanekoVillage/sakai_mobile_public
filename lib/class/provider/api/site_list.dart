// ignore_for_file: constant_identifier_names
// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:core';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/class/api/site.dart';
import 'package:sakai_mobile/const/pref_key.dart';
import 'package:sakai_mobile/const/cache_policy.dart';
import 'package:sakai_mobile/function/api/get_site.dart';
import 'package:sakai_mobile/provider/visible_site_list.dart';

const _PREF_ROOT_KEY = 'siteList';
const _GET_SITE_LIST_LIMIT = 20;

class SiteListProvider extends StateNotifier<List<Site>?> {
  SiteListProvider(super.state);

  int? _lastRefreshTime;
  String? _prefKey;
  Map<String, dynamic>? _localVisibleStateMap;
  bool _isInited = false;

  Future<void> init(SharedPreferences pref, WidgetRef ref, String key) async {
    _prefKey = key;
    _lastRefreshTime =
        pref.getInt('${_PREF_ROOT_KEY}_${_prefKey}_${StorePrefKey.LAST_TIME}');
    _localVisibleStateMap = jsonDecode(pref.getString(
            '${_PREF_ROOT_KEY}_${_prefKey}_${StorePrefKey.LOCAL_STATE}') ??
        '{}');
    state = SiteList.fromJson(jsonDecode(pref.getString(
                '${_PREF_ROOT_KEY}_${_prefKey}_${StorePrefKey.API_VALUE}') ??
            '{}'))
        .body;
    _isRefreshing = false;
    _isInited = true;

    _updateVisibleSiteList(ref);
  }

  bool getIsInited() {
    return _isInited;
  }

  /// refresh/forcedRefresh完了前に大量に呼び出されることを避けるため
  bool _isRefreshing = false;

  /// true -> MIN_ACCESS_INTERVAL 待機すること
  Future<bool> refresh(SharedPreferences pref, String domain) async {
    if (_isRefreshing || !(_isInitialized())) return false;
    if (!(_shouldRefresh(pref))) return false;
    pudding('${_PREF_ROOT_KEY}_${_prefKey}:refresh');
    _isRefreshing = true;

    List<Site> newSiteList = [];
    int start = 0;
    while (true) {
      final limitedSiteList =
          await getSiteList(domain, start: start, limit: _GET_SITE_LIST_LIMIT);
      if (limitedSiteList == null) break;
      if (limitedSiteList.length != 20) {
        newSiteList.addAll(limitedSiteList);
        break;
      }
      await Future.delayed(const Duration(seconds: MIN_ACCESS_INTERVAL));
      start += _GET_SITE_LIST_LIMIT;
    }

    if (newSiteList.isNotEmpty) {
      state = newSiteList;
    }

    _isRefreshing = false;
    _updateStoreApiValue(pref);
    return true;
  }

  /// true -> MIN_ACCESS_INTERVAL 待機すること
  Future<bool> forcedRefresh(SharedPreferences pref, String domain) async {
    if (_isRefreshing || !(_isInitialized())) return false;
    if (!(_canForcedRefresh(pref))) return false;
    pudding('${_PREF_ROOT_KEY}_${_prefKey}:forcedRefresh');
    _isRefreshing = true;

    List<Site> newSiteList = [];
    int start = 0;
    while (true) {
      final limitedSiteList =
          await getSiteList(domain, start: start, limit: _GET_SITE_LIST_LIMIT);
      if (limitedSiteList == null) break;

      newSiteList.addAll(limitedSiteList);
      if (limitedSiteList.length != 20) break;
      await Future.delayed(const Duration(seconds: MIN_ACCESS_INTERVAL));
      start += _GET_SITE_LIST_LIMIT;
    }

    if (newSiteList.isNotEmpty) {
      state = newSiteList;
    }

    _isRefreshing = false;
    _updateStoreApiValue(pref);
    return true;
  }

  /// startIndex は ReorderableListView onRecoderStart \
  /// endIndex は ReorderableListView onRecoderEnd で取得すること
  void reorder(SharedPreferences pref, WidgetRef ref, bool isVisibleMode,
      bool isDragDown, String startSiteId, String endSiteId) {
    if (state == null) return;
    if (!(_isInitialized())) return;

    if (isDragDown) {
      // when dragdown
      List<Site> newList = [];
      Site? tmp;
      bool shouldInterrupt = false;
      for (final site in state!) {
        if ((site.id ?? '') == startSiteId) {
          tmp = site;
          continue;
        }
        if ((site.id ?? '') == endSiteId) {
          shouldInterrupt = true;
          newList.add(site);
          continue;
        }
        if (shouldInterrupt) {
          newList.add(tmp!);
          shouldInterrupt = false;
          newList.add(site);
          continue;
        }
        newList.add(site);
      }
      if (newList.length != state!.length) {
        newList.add(tmp!);
      }
      state = newList;
    } else {
      // when dragup
      List<Site> newListFirst = [];
      List<Site> newListLast = [];
      Site? tmp;
      bool isFirst = true;
      for (final site in state!) {
        if ((site.id ?? '') == endSiteId) {
          isFirst = false;
        }
        if ((site.id ?? '') == startSiteId) {
          tmp = site;
          continue;
        }
        if (isFirst) {
          newListFirst.add(site);
        } else {
          newListLast.add(site);
        }
      }

      state = [...newListFirst, tmp!, ...newListLast];
    }

    _updateVisibleSiteList(ref);
    _updateStoreApiValue(pref);
  }

  void updateLocalState(
      SharedPreferences pref, WidgetRef ref, String siteId, bool value) {
    if (!(_isInitialized())) return;
    if (_localVisibleStateMap == null) return;
    _localVisibleStateMap![siteId] = value;
    _updateStoreLocalState(pref);
    _updateVisibleSiteList(ref);
  }

  bool? getLocalState(String siteId) {
    if (!(_isInitialized())) return null;
    if (_localVisibleStateMap == null) return null;
    return _localVisibleStateMap![siteId];
  }

  bool _isInitialized() {
    if (_prefKey == null) {
      pudding('Error: Not Initialized');
      return false;
    }
    return true;
  }

  bool _shouldRefresh(SharedPreferences pref) {
    // secondsSinceEpoch
    final nowTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    if (_lastRefreshTime == null ||
        nowTime - _lastRefreshTime! > MaxCacheAge.ONE_DAY) {
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
      pref.setInt('${_PREF_ROOT_KEY}_${_prefKey}_${StorePrefKey.LAST_TIME}',
          _lastRefreshTime!);
    }
  }

  Future<void> _updateStoreApiValue(SharedPreferences pref) async {
    pref.setString('${_PREF_ROOT_KEY}_${_prefKey}_${StorePrefKey.API_VALUE}',
        jsonEncode(SiteList(body: state).toJson()));
  }

  Future<void> _updateStoreLocalState(SharedPreferences pref) async {
    pref.setString('${_PREF_ROOT_KEY}_${_prefKey}_${StorePrefKey.LOCAL_STATE}',
        jsonEncode(_localVisibleStateMap));
  }

  void _updateVisibleSiteList(WidgetRef ref) {
    List<Site> visibleSiteList = [];

    if (state == null) return;
    for (final site in state!) {
      if (_localVisibleStateMap?[site.id] == true) visibleSiteList.add(site);
    }

    ref.read(visibleSiteListProvider.notifier).update(visibleSiteList);
  }
}
