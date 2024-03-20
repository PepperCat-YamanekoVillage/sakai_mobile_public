// ignore_for_file: constant_identifier_names

const MIN_REFRESH_INTERVAL = 30;

const MIN_ACCESS_INTERVAL = 1;

class MaxCacheAge {
  /// announcement/assignment \
  /// siteAnnouncement/siteResource/siteAssignment/siteQuiz
  static const TEN_MINUTES = 600;

  /// site !!! siteListはempty時以外自動更新しない
  static const ONE_DAY = 86400;

  /// siteRosterNum
  static const ONE_YEAR = 31536000;
}
