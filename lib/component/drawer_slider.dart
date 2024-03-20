import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/view/site_top.dart';
import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/provider/visible_site_list.dart';

class DrawerSlider extends ConsumerWidget {
  final SharedPreferences pref;
  const DrawerSlider({super.key, required this.pref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final siteList = ref.watch(visibleSiteListProvider);

    return SafeArea(
      left: false,
      right: false,
      child: ListView.builder(itemBuilder: (context, index) {
        if (index == 0) return const SizedBox(height: 48);
        if (siteList != null && index - 1 < siteList.length) {
          final site = siteList[index - 1];
          String siteId = site.id ?? '';
          String title = site.title ?? '';

          return ListTile(
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontVariations: [FontVariation('wght', 400)]),
            ),
            onTap: () {
              ref.read(viewProvider.notifier).update(
                  SiteTopView(pref: pref, siteId: siteId, title: title));
            },
          );
        }
      }),
    );
  }
}
