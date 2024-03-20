import 'dart:convert';

import 'package:sakai_mobile/class/api/site.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/function/api/get_html.dart';
import 'package:sakai_mobile/function/extract_json.dart';

Future<List<Site>?> getSiteList(String domain,
    {int start = 0, int limit = 20}) async {
  final url = 'https://$domain/direct/site.json?_start=$start&_limit=$limit';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final siteMapList = jsonDecodedMap['site_collection'];

    List<Site> result = [];
    for (final siteMap in siteMapList) {
      result.add(Site(
        id: siteMap['id'],
        title: siteMap['title'],
      ));
    }
    return result;
  } catch (e) {
    pudding(e);
    return null;
  }
}
