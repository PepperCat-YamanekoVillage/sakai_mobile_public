import 'dart:convert';

import 'package:sakai_mobile/class/api/roster.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/function/api/get_html.dart';
import 'package:sakai_mobile/function/extract_json.dart';

Future<List<Roster>?> getSiteRosterList(String siteId, String domain) async {
  final url = 'https://$domain/direct/roster/site/$siteId.json';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    longPudding(json);

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final rosterMapList = jsonDecodedMap['roster_collection'];

    List<Roster> result = [];
    for (final rosterMap in rosterMapList) {
      result.add(Roster(
        displayName: rosterMap['displayName'],
      ));
    }
    return result;
  } catch (e) {
    pudding(e);
    return null;
  }
}

Future<int?> getSiteRosterListLength(String siteId, String domain) async {
  final url = 'https://$domain/direct/roster/site/$siteId.json';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final List<dynamic> rosterMapList = jsonDecodedMap['roster_collection'];

    return rosterMapList.length;
  } catch (e) {
    pudding(e);
    return null;
  }
}
