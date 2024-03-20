import 'dart:convert';

import 'package:sakai_mobile/class/api/user.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/function/extract_json.dart';
import 'package:sakai_mobile/function/api/get_html.dart';

Future<User?> getUser(String userId, String domain) async {
  final url = 'https://$domain/direct/user/$userId.json';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final userMap = jsonDecodedMap;

    return User(
      id: userMap['id'],
      eid: userMap['eid'],
      displayId: userMap['displayId'],
      maskedDisplayId: userMap['maskedDisplayId'],
      displayName: userMap['displayName'],
      firstName: userMap['firstName'],
      lastName: userMap['lastName'],
      sortName: userMap['sortName'],
      email: userMap['email'],
    );
  } catch (e) {
    pudding(e);
    return null;
  }
}
