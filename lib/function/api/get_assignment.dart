import 'dart:convert';

import 'package:sakai_mobile/class/api/assignment.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/function/api/get_html.dart';
import 'package:sakai_mobile/function/extract_json.dart';

Future<List<Assignment>?> getAssignmentList(String domain) async {
  final url = 'https://$domain/direct/assignment/my.json';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final assignmentList = jsonDecodedMap['assignment_collection'];

    List<Assignment> result = [];
    for (final assignmentMap in assignmentList) {
      int? openTime;
      int? dueTime;

      if (assignmentMap['openTime'] != null) {
        openTime =
            (assignmentMap['openTime'] as Map<String, dynamic>)["epochSecond"];
      }
      if (assignmentMap['dueTime'] != null) {
        dueTime =
            (assignmentMap['dueTime'] as Map<String, dynamic>)["epochSecond"];
      }

      result.add(Assignment(
        title: assignmentMap['title'],
        id: assignmentMap['id'],
        hadSubmissions: (assignmentMap['submissions'] != null),
        openTime: openTime,
        dueTime: dueTime,
      ));
    }
    return result;
  } catch (e) {
    pudding(e);
    return null;
  }
}

Future<List<Assignment>?> getSiteAssignmentList(
    String siteId, String domain) async {
  final url = 'https://$domain/direct/assignment/site/$siteId.json';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final assignmentList = jsonDecodedMap['assignment_collection'];

    List<Assignment> result = [];
    for (final assignmentMap in assignmentList) {
      int? openTime;
      int? dueTime;

      if (assignmentMap['openTime'] != null) {
        openTime =
            (assignmentMap['openTime'] as Map<String, dynamic>)["epochSecond"];
      }
      if (assignmentMap['dueTime'] != null) {
        dueTime =
            (assignmentMap['dueTime'] as Map<String, dynamic>)["epochSecond"];
      }

      result.add(Assignment(
        title: assignmentMap['title'],
        id: assignmentMap['id'],
        hadSubmissions: (assignmentMap['submissions'] != null),
        openTime: openTime,
        dueTime: dueTime,
      ));
    }
    return result;
  } catch (e) {
    pudding(e);
    return null;
  }
}
