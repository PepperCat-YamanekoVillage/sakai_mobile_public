import 'dart:convert';

import 'package:sakai_mobile/class/api/resource.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/function/api/get_html.dart';
import 'package:sakai_mobile/function/extract_json.dart';

Future<List<Resource>?> getSiteResourceList(
    String siteId, String domain) async {
  final url = 'https://$domain/direct/content/site/$siteId.json';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final resouceMapList = jsonDecodedMap['content_collection'];

    List<Resource> result = [];
    for (final resouceMap in resouceMapList) {
      result.add(Resource(
        author: resouceMap['author'],
        authorId: resouceMap['authorId'],
        container: resouceMap['container'],
        numChildren: resouceMap['numChildren'],
        modifiedDate: resouceMap['modifiedDate'],
        title: resouceMap['title'],
        type: resouceMap['type'],
        webLinkUrl: resouceMap['webLinkUrl'],
        url: resouceMap['url'],
      ));
    }
    return result;
  } catch (e) {
    pudding(e);
    return null;
  }
}
