import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/class/api/assignment.dart';
import 'package:sakai_mobile/class/provider/api/assignment_list.dart';
import 'package:sakai_mobile/class/view/site_list_with_one_site_details_slider_view.dart';
import 'package:sakai_mobile/const/color.dart';
import 'package:sakai_mobile/component/app_bar_box.dart';
import 'package:sakai_mobile/function/get_urgent_color.dart';
import 'package:sakai_mobile/provider/url.dart';
import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/view/site_top.dart';

class SiteAssignmentView extends SiteListWithOneSiteDetailsSliderView {
  final SharedPreferences pref;
  SiteAssignmentView(
      {super.key,
      required this.pref,
      required super.siteId,
      required super.title,
      super.type = 3});

  final provider =
      StateNotifierProvider<AssignmentListProvider, List<Assignment>?>(
          (_) => AssignmentListProvider(null));

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
            child: _SiteAssignmentView(
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

class _SiteAssignmentView extends ConsumerWidget {
  final SharedPreferences pref;
  final StateNotifierProvider<AssignmentListProvider, List<Assignment>?>
      provider;
  const _SiteAssignmentView({required this.pref, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignmentList = ref.watch(provider);

    if (assignmentList == null || assignmentList.isEmpty) {
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

    List<Assignment> unsubmittedAssignmentList = [];
    List<Assignment> submittedAssignmentList = [];

    for (final assignment in assignmentList) {
      if (assignment.hadSubmissions == true) {
        submittedAssignmentList.add(assignment);
      } else {
        unsubmittedAssignmentList.add(assignment);
      }
    }

    unsubmittedAssignmentList.sort((a, b) {
      if (a.dueTime == null) {
        return -1;
      }
      if (b.dueTime == null) {
        return 1;
      }
      if (a.dueTime! < b.dueTime!) {
        return -1;
      }
      if (a.dueTime! > b.dueTime!) {
        return 1;
      }
      return 0;
    });
    submittedAssignmentList.sort((a, b) {
      if (a.dueTime == null) {
        return -1;
      }
      if (b.dueTime == null) {
        return 1;
      }
      if (a.dueTime! < b.dueTime!) {
        return -1;
      }
      if (a.dueTime! > b.dueTime!) {
        return 1;
      }
      return 0;
    });

    final sortedAssignmentList = [
      ...unsubmittedAssignmentList,
      ...submittedAssignmentList
    ];

    return RefreshIndicator(
      onRefresh: () => forcedRefresh(ref),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < sortedAssignmentList.length) {
            final assignment = sortedAssignmentList[index];
            final title = assignment.title;
            final dueTime = assignment.dueTime;
            final hadSubmissions = assignment.hadSubmissions ?? false;

            final dueTimeStr = (dueTime != null)
                ? DateFormat()
                    .format(DateTime.fromMillisecondsSinceEpoch(dueTime * 1000))
                : '?';

            return Container(
              color: hadSubmissions
                  ? DueStateColor.GREY
                  : getUrgentColor(dueTime ?? 0),
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 15, right: 15),
                title: Text(
                  title ?? '',
                  style: const TextStyle(
                      height: 1.3,
                      fontSize: 25,
                      fontVariations: [FontVariation('wght', 500)]),
                ),
                subtitle: Text(
                  '${L10n.of(context)!.due}:  $dueTimeStr',
                  style: const TextStyle(
                      fontVariations: [FontVariation('wght', 500)]),
                ),
              ),
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
