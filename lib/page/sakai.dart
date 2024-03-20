import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/class/view/no_slider_view.dart';
import 'package:sakai_mobile/class/view/site_list_slider_view.dart';
import 'package:sakai_mobile/class/view/site_list_with_one_site_details_slider_view.dart';
import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/view/sites.dart';
import 'package:sakai_mobile/view/tasks.dart';
import 'package:sakai_mobile/view/annnouncements.dart';
import 'package:sakai_mobile/component/drawer_slider.dart';
import 'package:sakai_mobile/component/drawer_slider_with_details.dart';

class SakaiPage extends ConsumerWidget {
  final SharedPreferences pref;
  const SakaiPage({super.key, required this.pref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: _View(pref: pref),
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeViewColor: Theme.of(context).primaryColorDark,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.indicator,
        selectedItemColor: Theme.of(context).primaryColorDark.withOpacity(0.63),
        unselectedItemColor: Theme.of(context).primaryColorDark,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.school,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.task,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.notifications,
          )),
        ],
        padding: const EdgeInsets.only(left: 15, right: 15),
        onTap: (index) {
          switch (index) {
            case 0:
              ref.read(viewProvider.notifier).update(SitesView(pref: pref));
              break;
            case 1:
              ref.read(viewProvider.notifier).update(TasksView(pref: pref));
              break;
            case 2:
              ref
                  .read(viewProvider.notifier)
                  .update(AnnouncementsView(pref: pref));
              break;
          }
          ;
        },
      ),
    );
  }
}

class _View extends ConsumerWidget {
  final SharedPreferences pref;
  const _View({required this.pref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(viewProvider) ?? SitesView(pref: pref);

    if (view is NoSliderView) {
      return view;
    }
    if (view is SiteListSliderView) {
      const drawerKey = Key('drawer');
      return SliderDrawer(
        key: drawerKey,
        slideDirection: SlideDirection.LEFT_TO_RIGHT,
        appBar: null,
        slider: Container(
          color: Theme.of(context).primaryColor,
          child: DrawerSlider(pref: pref),
        ),
        child: view,
      );
    }
    if (view is SiteListWithOneSiteDetailsSliderView) {
      final siteId = view.siteId ?? '';
      final title = view.title ?? '';
      final type = view.type;

      final drawerKey = Key('drawer_${siteId}_$type');

      return SliderDrawer(
        key: drawerKey,
        slideDirection: SlideDirection.LEFT_TO_RIGHT,
        appBar: null,
        slider: Container(
          color: Theme.of(context).primaryColor,
          child: DrawerSliderWithDetails(
            pref: pref,
            siteId: siteId,
            title: title,
          ),
        ),
        child: view,
      );
    }
    return view;
  }
}
