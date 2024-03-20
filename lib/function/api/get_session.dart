import 'dart:convert';

import 'package:sakai_mobile/class/api/session.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/function/extract_json.dart';
import 'package:sakai_mobile/function/api/get_html.dart';

Future<Session?> getSession(String domain) async {
  final url = 'https://$domain/direct/session.json';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final sessionMapList = jsonDecodedMap['session_collection'];
    final sessionMap = sessionMapList[0];

    return Session(
      userId: sessionMap['userId'],
      userEid: sessionMap['userEid'],
    );
  } catch (e) {
    pudding(e);
    return null;
  }
}
