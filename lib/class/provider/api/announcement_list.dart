// ignore_for_file: constant_identifier_names
// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:core';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/class/api/announcement.dart';
import 'package:sakai_mobile/const/pref_key.dart';
import 'package:sakai_mobile/const/cache_policy.dart';
import 'package:sakai_mobile/function/api/get_announcement.dart';

const _PREF_ROOT_KEY = 'announcementList';
const _ALL_SITE_PREF_KEY = '////myAllSites////';

class AnnouncementListProvider extends StateNotifier<List<Announcement>?> {
  AnnouncementListProvider(super.state);

  int? _lastRefreshTime;
  String? _siteId;
  Map<String, dynamic>? _localReadStateMap;

  Future<void> init(SharedPreferences pref, {String? siteId}) async {
    _siteId = (siteId ?? _ALL_SITE_PREF_KEY);
    _lastRefreshTime =
        pref.getInt('${_PREF_ROOT_KEY}_${_siteId}_${StorePrefKey.LAST_TIME}');
    _localReadStateMap = jsonDecode(
        pref.getString('${_PREF_ROOT_KEY}__${StorePrefKey.LOCAL_STATE}') ??
            '{}');
    state = AnnouncementList.fromJson(jsonDecode(pref.getString(
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

    final announcementList = (_siteId == _ALL_SITE_PREF_KEY)
        ? await getAnnouncementList(domain, n: 30)
        : await getSiteAnnouncementList(_siteId!, domain);

    if (announcementList != null && announcementList.isNotEmpty) {
      state = announcementList;
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

    final announcementList = (_siteId == _ALL_SITE_PREF_KEY)
        ? await getAnnouncementList(domain, n: 30)
        : await getSiteAnnouncementList(_siteId!, domain);

    if (announcementList != null && announcementList.isNotEmpty) {
      state = announcementList;
    }

    _isRefreshing = false;
    _updateStoreApiValue(pref);
    return true;
  }

  void updateLocalState(
      SharedPreferences pref, String announcementId, bool value) {
    if (!(_isInitialized())) return;
    if (_localReadStateMap == null) return;
    _localReadStateMap![announcementId] = value;
    _updateStoreLocalState(pref);
  }

  bool? getLocalState(String announcementId) {
    if (!(_isInitialized())) return null;
    if (_localReadStateMap == null) return null;
    return _localReadStateMap![announcementId];
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
        jsonEncode(AnnouncementList(body: state).toJson()));
  }

  Future<void> _updateStoreLocalState(SharedPreferences pref) async {
    pref.setString('${_PREF_ROOT_KEY}__${StorePrefKey.LOCAL_STATE}',
        jsonEncode(_localReadStateMap));
  }
}
