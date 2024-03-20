import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sakai_mobile/class/api/site.dart';

final visibleSiteListProvider =
    StateNotifierProvider<_VisibleSiteListProvider, List<Site>?>(
        (_) => _VisibleSiteListProvider(null));

class _VisibleSiteListProvider extends StateNotifier<List<Site>?> {
  _VisibleSiteListProvider(super.state);

  void update(List<Site> visibleSiteList) {
    state = visibleSiteList;
  }
}
