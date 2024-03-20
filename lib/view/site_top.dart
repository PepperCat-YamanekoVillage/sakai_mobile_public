import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:sakai_mobile/class/view/site_list_with_one_site_details_slider_view.dart';
import 'package:sakai_mobile/component/app_bar_box.dart';
import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/view/sites.dart';
import 'package:sakai_mobile/view/site_announcement.dart';
import 'package:sakai_mobile/view/site_resource.dart';
import 'package:sakai_mobile/view/site_assignment.dart';
import 'package:sakai_mobile/view/site_quiz.dart';

class SiteTopView extends SiteListWithOneSiteDetailsSliderView {
  final SharedPreferences pref;
  const SiteTopView(
      {super.key,
      required this.pref,
      required super.siteId,
      required super.title,
      super.type = 0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        AppBarBox(
          color: Theme.of(context).primaryColor,
          text: title ?? '',
          textColor: Colors.white,
          leftWidget: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () =>
                ref.read(viewProvider.notifier).update(SitesView(pref: pref)),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              ListTile(
                leading: const Icon(
                  Icons.notifications,
                  size: 35,
                ),
                title: SizedBox(
                  height: 50,
                  child: AutoSizeText(
                    L10n.of(context)!.announcement,
                    maxLines: 1,
                    minFontSize: 16,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 1000,
                        letterSpacing: -0.7,
                        fontVariations: [FontVariation('wght', 500)]),
                  ),
                ),
                onTap: () =>
                    ref.read(viewProvider.notifier).update(SiteAnnouncementView(
                          pref: pref,
                          siteId: siteId,
                          title: title,
                        )),
              ),
              Divider(
                color: Theme.of(context).primaryColorDark,
                height: 5,
                thickness: 0.55,
              ),
              ListTile(
                leading: const Icon(
                  Icons.folder,
                  size: 35,
                ),
                title: SizedBox(
                  height: 50,
                  child: AutoSizeText(
                    L10n.of(context)!.resource,
                    maxLines: 1,
                    minFontSize: 16,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 1000,
                        letterSpacing: -0.7,
                        fontVariations: [FontVariation('wght', 500)]),
                  ),
                ),
                onTap: () =>
                    ref.read(viewProvider.notifier).update(SiteResourceView(
                          pref: pref,
                          siteId: siteId,
                          title: title,
                        )),
              ),
              Divider(
                color: Theme.of(context).primaryColorDark,
                height: 5,
                thickness: 0.55,
              ),
              ListTile(
                leading: const Icon(
                  Icons.edit_document,
                  size: 35,
                ),
                title: SizedBox(
                  height: 50,
                  child: AutoSizeText(
                    L10n.of(context)!.assignment,
                    maxLines: 1,
                    minFontSize: 16,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 1000,
                        letterSpacing: -0.7,
                        fontVariations: [FontVariation('wght', 500)]),
                  ),
                ),
                onTap: () =>
                    ref.read(viewProvider.notifier).update(SiteAssignmentView(
                          pref: pref,
                          siteId: siteId,
                          title: title,
                        )),
              ),
              Divider(
                color: Theme.of(context).primaryColorDark,
                height: 5,
                thickness: 0.55,
              ),
              ListTile(
                leading: const Icon(
                  Icons.quiz,
                  size: 35,
                ),
                title: SizedBox(
                  height: 50,
                  child: AutoSizeText(
                    L10n.of(context)!.quiz,
                    maxLines: 1,
                    minFontSize: 16,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 1000,
                        letterSpacing: -0.7,
                        fontVariations: [FontVariation('wght', 500)]),
                  ),
                ),
                onTap: () =>
                    ref.read(viewProvider.notifier).update(SiteQuizView(
                          pref: pref,
                          siteId: siteId,
                          title: title,
                        )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
