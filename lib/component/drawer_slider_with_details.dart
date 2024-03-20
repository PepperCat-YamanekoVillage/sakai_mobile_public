import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/provider/visible_site_list.dart';
import 'package:sakai_mobile/view/site_top.dart';
import 'package:sakai_mobile/view/site_announcement.dart';
import 'package:sakai_mobile/view/site_resource.dart';
import 'package:sakai_mobile/view/site_assignment.dart';
import 'package:sakai_mobile/view/site_quiz.dart';

class DrawerSliderWithDetails extends ConsumerWidget {
  final SharedPreferences pref;
  final String siteId;
  final String title;

  const DrawerSliderWithDetails({
    super.key,
    required this.pref,
    required this.siteId,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibleSiteList = ref.watch(visibleSiteListProvider);

    return SafeArea(
      left: false,
      right: false,
      child: ListView.builder(itemBuilder: (context, index) {
        if (index == 0) return const SizedBox(height: 48);
        // 今開いている site の要素一覧
        if (index == 1) {
          return SizedBox(
            height: 60,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontVariations: [FontVariation('wght', 400)]),
              ),
              onTap: () => ref.read(viewProvider.notifier).update(
                  SiteTopView(pref: pref, siteId: siteId, title: title)),
            ),
          );
        }
        if (index == 2) {
          return SizedBox(
            height: 40,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 40),
              title: Text(
                L10n.of(context)!.announcement,
                style: const TextStyle(
                    color: Colors.white,
                    fontVariations: [FontVariation('wght', 400)]),
              ),
              onTap: () => ref.read(viewProvider.notifier).update(
                  SiteAnnouncementView(
                      pref: pref, siteId: siteId, title: title)),
            ),
          );
        }
        if (index == 3) {
          return SizedBox(
            height: 40,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 40),
              title: Text(
                L10n.of(context)!.resource,
                style: const TextStyle(
                    color: Colors.white,
                    fontVariations: [FontVariation('wght', 400)]),
              ),
              onTap: () => ref.read(viewProvider.notifier).update(
                  SiteResourceView(pref: pref, siteId: siteId, title: title)),
            ),
          );
        }
        if (index == 4) {
          return SizedBox(
            height: 40,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 40),
              title: Text(
                L10n.of(context)!.assignment,
                style: const TextStyle(
                    color: Colors.white,
                    fontVariations: [FontVariation('wght', 400)]),
              ),
              onTap: () => ref.read(viewProvider.notifier).update(
                  SiteAssignmentView(pref: pref, siteId: siteId, title: title)),
            ),
          );
        }
        if (index == 5) {
          return SizedBox(
            height: 40,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 40),
              title: Text(
                L10n.of(context)!.quiz,
                style: const TextStyle(
                    color: Colors.white,
                    fontVariations: [FontVariation('wght', 400)]),
              ),
              onTap: () => ref.read(viewProvider.notifier).update(
                  SiteQuizView(pref: pref, siteId: siteId, title: title)),
            ),
          );
        }

        if (index == 6) return const SizedBox(height: 70);
        // visibleSiteListより
        if (visibleSiteList != null && index - 7 < visibleSiteList.length) {
          final visibleSite = visibleSiteList[index - 7];
          String visibleSiteId = visibleSite.id ?? '';
          String visibleTitle = visibleSite.title ?? '';

          return ListTile(
            title: Text(
              visibleTitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontVariations: [FontVariation('wght', 400)]),
            ),
            onTap: () {
              ref.read(viewProvider.notifier).update(SiteTopView(
                  pref: pref, siteId: visibleSiteId, title: visibleTitle));
            },
          );
        }
      }),
    );
  }
}
