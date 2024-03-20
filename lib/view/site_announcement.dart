import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';

import 'package:sakai_mobile/class/api/announcement.dart';
import 'package:sakai_mobile/class/provider/api/announcement_list.dart';
import 'package:sakai_mobile/class/view/site_list_with_one_site_details_slider_view.dart';
import 'package:sakai_mobile/page/announcement.dart';
import 'package:sakai_mobile/component/app_bar_box.dart';
import 'package:sakai_mobile/provider/url.dart';
import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/view/site_top.dart';

class SiteAnnouncementView extends SiteListWithOneSiteDetailsSliderView {
  final SharedPreferences pref;
  SiteAnnouncementView(
      {super.key,
      required this.pref,
      required super.siteId,
      required super.title,
      super.type = 1});

  final provider =
      StateNotifierProvider<AnnouncementListProvider, List<Announcement>?>(
          (_) => AnnouncementListProvider(null));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(provider.notifier).init(pref, siteId: siteId ?? '').then((_) {
        refresh(ref);
      });
    });

    return Column(
      children: [
        AppBarBox(
          color: Theme.of(context).primaryColor,
          text: title ?? '',
          textColor: Colors.white,
          leftWidget: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => ref
                .read(viewProvider.notifier)
                .update(SiteTopView(pref: pref, siteId: siteId, title: title)),
          ),
        ),
        Expanded(
            child: _SiteAnnouncementView(
          pref: pref,
          provider: provider,
        )),
      ],
    );
  }

  Future refresh(WidgetRef ref) async {
    final domain = ref.read(domainProvider);
    if (domain == null) return;

    ref.watch(provider.notifier).refresh(pref, domain);
  }
}

class _SiteAnnouncementView extends ConsumerWidget {
  final SharedPreferences pref;
  final StateNotifierProvider<AnnouncementListProvider, List<Announcement>?>
      provider;
  const _SiteAnnouncementView({required this.pref, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementList = ref.watch(provider);

    if (announcementList == null || announcementList.isEmpty) {
      return RefreshIndicator(
          onRefresh: () => forcedRefresh(ref),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              color: Colors.white,
              height: double.maxFinite,
            ),
          ));
    }

    List<Announcement> notreadAnnouncementList = [];
    List<Announcement> wasreadAnnouncementList = [];

    for (final announcement in announcementList) {
      final announcementId = announcement.id ?? '';
      final wasRead = ref.read(provider.notifier).getLocalState(announcementId);
      if (wasRead == true) {
        wasreadAnnouncementList.add(announcement);
      } else {
        notreadAnnouncementList.add(announcement);
      }
    }

    final sortedAnnouncementList = [
      ...notreadAnnouncementList,
      ...wasreadAnnouncementList
    ];

    return RefreshIndicator(
      onRefresh: () => forcedRefresh(ref),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < sortedAnnouncementList.length) {
            final announcement = sortedAnnouncementList[index];
            final announcementId = announcement.id;
            bool? wasRead;

            if (announcementId != null) {
              wasRead =
                  ref.read(provider.notifier).getLocalState(announcementId);
            }

            return _AnnouncementListTile(
              announcement: announcement,
              wasInitRead: wasRead ?? false,
              pref: pref,
              provider: provider,
            );
          }
        },
      ),
    );
  }

  Future forcedRefresh(WidgetRef ref) async {
    final domain = ref.read(domainProvider);
    if (domain == null) return;

    await ref.watch(provider.notifier).forcedRefresh(pref, domain);
  }
}

class _AnnouncementListTile extends ConsumerStatefulWidget {
  final Announcement announcement;
  final bool wasInitRead;
  final SharedPreferences pref;
  final StateNotifierProvider<AnnouncementListProvider, List<Announcement>?>
      provider;

  const _AnnouncementListTile(
      {required this.announcement,
      required this.wasInitRead,
      required this.pref,
      required this.provider});

  @override
  createState() => _AnnouncementListTileState();
}

class _AnnouncementListTileState extends ConsumerState<_AnnouncementListTile> {
  bool? wasRead;

  @override
  Widget build(BuildContext context) {
    if (wasRead == null) {
      setState(() {
        wasRead = widget.wasInitRead;
      });
    }

    final title = widget.announcement.title;
    final createdDate = widget.announcement.createdOn;
    final author = widget.announcement.createdByDisplayName;
    final id = widget.announcement.id;

    final createdTimeStr = (createdDate != null)
        ? DateFormat().format(DateTime.fromMillisecondsSinceEpoch(createdDate))
        : '?';

    return Stack(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          title: Text(
            title ?? '',
            style: const TextStyle(
                height: 1.2,
                fontSize: 25,
                fontVariations: [FontVariation('wght', 500)]),
          ),
          subtitle: Text(
            '${L10n.of(context)!.author}:  $author\n$createdTimeStr',
            style:
                const TextStyle(fontVariations: [FontVariation('wght', 500)]),
          ),
          onTap: () {
            if (wasRead != true) {
              ref
                  .read(widget.provider.notifier)
                  .updateLocalState(widget.pref, id ?? '', true);
              setState(() {
                wasRead = true;
              });
            }
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: AnnouncementPage(announcement: widget.announcement),
              ),
            );
          },
        ),
        if (wasRead == false)
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'New',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 18,
                      fontVariations: const [FontVariation('wght', 700)]),
                ),
              ))
      ],
    );
  }
}
