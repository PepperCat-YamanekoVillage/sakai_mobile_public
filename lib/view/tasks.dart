import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/class/api/assignment.dart';
import 'package:sakai_mobile/class/provider/api/assignment_list.dart';
import 'package:sakai_mobile/class/view/no_slider_view.dart';
import 'package:sakai_mobile/class/api/quiz.dart';
import 'package:sakai_mobile/class/provider/api/quiz_list.dart';
import 'package:sakai_mobile/const/color.dart';
import 'package:sakai_mobile/const/cache_policy.dart';
import 'package:sakai_mobile/component/app_bar_box.dart';
import 'package:sakai_mobile/function/get_urgent_color.dart';
import 'package:sakai_mobile/provider/visible_site_list.dart';
import 'package:sakai_mobile/provider/url.dart';

class TasksView extends NoSliderView {
  final SharedPreferences pref;
  const TasksView({super.key, required this.pref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibleSiteList = ref.watch(visibleSiteListProvider);

    if (visibleSiteList != null) {
      for (final site in visibleSiteList) {
        final siteId = site.id;
        if (siteId == null || _quizListProviderMap[siteId] != null) continue;
        _quizListProviderMap[siteId] =
            StateNotifierProvider<QuizListProvider, List<Quiz>?>(
                (_) => QuizListProvider(null));
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      init(ref).then((_) => refresh(ref));
    });

    return Column(
      children: [
        AppBarBox(
          color: Theme.of(context).primaryColor,
          text: L10n.of(context)!.task,
          textColor: Colors.white,
        ),
        Expanded(child: _TasksView(pref: pref)),
      ],
    );
  }

  Future init(WidgetRef ref) async {
    await ref.read(_assignmentListProvider.notifier).init(pref);
    _quizListProviderMap.forEach((siteId, quizListProvider) async {
      await ref.read(quizListProvider.notifier).init(pref, siteId);
    });
    return;
  }

  Future refresh(WidgetRef ref) async {
    final domain = ref.read(domainProvider);
    if (domain == null) return;

    final isAssignmentListRefreshed =
        await ref.read(_assignmentListProvider.notifier).refresh(pref, domain);

    if (isAssignmentListRefreshed) {
      await Future.delayed(const Duration(seconds: MIN_ACCESS_INTERVAL));
    }

    // forEach だと MIN_ACCESS_INTERVAL がとれない
    for (final quizListProvider in _quizListProviderMap.values) {
      if (!(ref.context.mounted)) return;
      final isSiteQuizListRefreshed =
          await ref.read(quizListProvider.notifier).forcedRefresh(pref, domain);
      if (isSiteQuizListRefreshed) {
        await Future.delayed(const Duration(seconds: MIN_ACCESS_INTERVAL));
      }
    }
  }
}

class _TasksView extends ConsumerWidget {
  final SharedPreferences pref;

  const _TasksView({required this.pref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<(String, int?, bool)> taskList = [];

    final assignmentList = ref.watch(_assignmentListProvider);
    if (assignmentList != null && assignmentList.isNotEmpty) {
      for (final assignment in assignmentList) {
        final title = assignment.title ?? '';
        final dueDate =
            (assignment.dueTime != null) ? assignment.dueTime! * 1000 : null;
        final hadSubmitted = assignment.hadSubmissions ?? false;
        taskList.add((title, dueDate, hadSubmitted));
      }
    }

    _quizListProviderMap.forEach((_, quizListProvider) {
      final siteQuizList = ref.watch(quizListProvider);
      if (siteQuizList != null && siteQuizList.isNotEmpty) {
        for (final quiz in siteQuizList) {
          final title = quiz.title ?? '';
          final dueDate = quiz.dueDate;
          final hadSubmitted =
              (quiz.submittedCount != null && quiz.submittedCount != 0);
          taskList.add((title, dueDate, hadSubmitted));
        }
      }
    });

    if (taskList.isEmpty) {
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

    List<(String, int?, bool)> unsubmittedTaskList = [];
    List<(String, int?, bool)> submittedTaskList = [];

    for (final task in taskList) {
      if (task.$3) {
        submittedTaskList.add(task);
      } else {
        unsubmittedTaskList.add(task);
      }
    }

    unsubmittedTaskList.sort((a, b) {
      if (a.$2 == null) {
        return -1;
      }
      if (b.$2 == null) {
        return 1;
      }
      if (a.$2! < b.$2!) {
        return -1;
      }
      if (a.$2! > b.$2!) {
        return 1;
      }
      return 0;
    });
    submittedTaskList.sort((a, b) {
      if (a.$2 == null) {
        return -1;
      }
      if (b.$2 == null) {
        return 1;
      }
      if (a.$2! < b.$2!) {
        return -1;
      }
      if (a.$2! > b.$2!) {
        return 1;
      }
      return 0;
    });

    final sortedTaskList = [...unsubmittedTaskList, ...submittedTaskList];

    return RefreshIndicator(
      onRefresh: () => forcedRefresh(ref),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < sortedTaskList.length) {
            final task = sortedTaskList[index];
            final title = task.$1;
            final dueDate = task.$2;
            final hadSubmissions = task.$3;

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
                  title,
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

    final isAssignmentListRefreshed = await ref
        .read(_assignmentListProvider.notifier)
        .forcedRefresh(pref, domain);

    if (isAssignmentListRefreshed) {
      await Future.delayed(const Duration(seconds: MIN_ACCESS_INTERVAL));
    }

    // forEach だと MIN_ACCESS_INTERVAL がとれない
    for (final quizListProvider in _quizListProviderMap.values) {
      if (!(ref.context.mounted)) return;
      final isSiteQuizListRefreshed =
          await ref.read(quizListProvider.notifier).forcedRefresh(pref, domain);
      if (isSiteQuizListRefreshed) {
        await Future.delayed(const Duration(seconds: MIN_ACCESS_INTERVAL));
      }
    }
  }
}

final _assignmentListProvider =
    StateNotifierProvider<AssignmentListProvider, List<Assignment>?>(
        (_) => AssignmentListProvider(null));

Map<String, StateNotifierProvider<QuizListProvider, List<Quiz>?>>
    _quizListProviderMap = {};
