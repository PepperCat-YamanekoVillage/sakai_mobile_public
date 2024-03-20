import 'dart:convert';

import 'package:sakai_mobile/class/api/quiz.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/function/api/get_html.dart';
import 'package:sakai_mobile/function/extract_json.dart';

// 'https://$domain/direct/sam_pub.json' not working

Future<List<Quiz>?> getSiteQuizList(String siteId, String domain) async {
  final url = 'https://$domain/direct/sam_pub/context/$siteId.json';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final quizMapList = jsonDecodedMap['sam_pub_collection'];

    List<Quiz> result = [];
    for (final quizMap in quizMapList) {
      result.add(Quiz(
        title: quizMap['title'],
        publishedAssessmentId: quizMap['publishedAssessmentId'],
        startDate: quizMap['startDate'],
        dueDate: quizMap['dueDate'],
        submittedCount: quizMap['submittedCount'],
        enrolledStudentCount: quizMap['enrolledStudentCount'],
      ));
    }
    return result;
  } catch (e) {
    pudding(e);
    return null;
  }
}
