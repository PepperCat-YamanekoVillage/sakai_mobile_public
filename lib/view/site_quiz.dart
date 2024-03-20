import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/class/api/quiz.dart';
import 'package:sakai_mobile/class/provider/api/quiz_list.dart';
import 'package:sakai_mobile/class/provider/api/roster_num.dart';
import 'package:sakai_mobile/class/view/site_list_with_one_site_details_slider_view.dart';
import 'package:sakai_mobile/const/color.dart';
import 'package:sakai_mobile/component/app_bar_box.dart';
import 'package:sakai_mobile/function/get_urgent_color.dart';
import 'package:sakai_mobile/provider/url.dart';
import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/view/site_top.dart';

class SiteQuizView extends SiteListWithOneSiteDetailsSliderView {
  final SharedPreferences pref;
  SiteQuizView(
      {super.key,
      required this.pref,
      required super.siteId,
      required super.title,
      super.type = 4});

  final quizListProvider = StateNotifierProvider<QuizListProvider, List<Quiz>?>(
      (_) => QuizListProvider(null));
  final rosterNumProvider = StateNotifierProvider<RosterNumProvider, int?>(
      (_) => RosterNumProvider(null));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(quizListProvider.notifier).init(pref, siteId ?? '').then((_) {
        refreshQuizList(ref);
      });
      ref.read(rosterNumProvider.notifier).init(pref, siteId ?? '').then((_) {
        refreshRosterNum(ref);
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
            child: _SiteQuizView(
          pref: pref,
          quizListProvider: quizListProvider,
          rosterNumProvider: rosterNumProvider,
        )),
      ],
    );
  }

  Future refreshQuizList(WidgetRef ref) async {
    final domain = ref.read(domainProvider);
    if (domain == null) return;

    ref.watch(quizListProvider.notifier).refresh(pref, domain);
  }

  Future refreshRosterNum(WidgetRef ref) async {
    final domain = ref.read(domainProvider);
    if (domain == null) return;

    ref.watch(rosterNumProvider.notifier).refresh(pref, domain);
  }
}

class _SiteQuizView extends ConsumerWidget {
  final SharedPreferences pref;
  final StateNotifierProvider<QuizListProvider, List<Quiz>?> quizListProvider;
  final StateNotifierProvider<RosterNumProvider, int?> rosterNumProvider;

  const _SiteQuizView({
    required this.pref,
    required this.quizListProvider,
    required this.rosterNumProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizListProvider);
    final rosterNum = ref.watch(rosterNumProvider);

    if (quizList == null || quizList.isEmpty) {
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

    List<Quiz> unsubmittedQuizList = [];
    List<Quiz> submittedQuizList = [];

    for (final quiz in quizList) {
      if (quiz.submittedCount != null && quiz.submittedCount != 0) {
        submittedQuizList.add(quiz);
      } else {
        unsubmittedQuizList.add(quiz);
      }
    }

    unsubmittedQuizList.sort((a, b) {
      if (a.dueDate == null) {
        return -1;
      }
      if (b.dueDate == null) {
        return 1;
      }
      if (a.dueDate! < b.dueDate!) {
        return -1;
      }
      if (a.dueDate! > b.dueDate!) {
        return 1;
      }
      return 0;
    });
    submittedQuizList.sort((a, b) {
      if (a.dueDate == null) {
        return -1;
      }
      if (b.dueDate == null) {
        return 1;
      }
      if (a.dueDate! < b.dueDate!) {
        return -1;
      }
      if (a.dueDate! > b.dueDate!) {
        return 1;
      }
      return 0;
    });

    final sortedQuizList = [...unsubmittedQuizList, ...submittedQuizList];

    return RefreshIndicator(
      onRefresh: () => forcedRefresh(ref),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < sortedQuizList.length) {
            final quiz = sortedQuizList[index];
            final title = quiz.title;
            final dueDate = quiz.dueDate;
            final hadSubmissions =
                (quiz.submittedCount != null && quiz.submittedCount != 0);
            final submittedStudentCount = quiz.enrolledStudentCount;

            final dueTimeStr = (dueDate != null)
                ? DateFormat()
                    .format(DateTime.fromMillisecondsSinceEpoch(dueDate))
                : '?';

            return Container(
              color: hadSubmissions
                  ? DueStateColor.GREY
                  : getUrgentColor((dueDate ?? 0) ~/ 1000),
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
                  '${L10n.of(context)!.due}:  $dueTimeStr\n${L10n.of(context)!.submitted}:  ${submittedStudentCount ?? '?'}/${rosterNum ?? '?'}',
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

    await ref.watch(quizListProvider.notifier).forcedRefresh(pref, domain);
  }
}
