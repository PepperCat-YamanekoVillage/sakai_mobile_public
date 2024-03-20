import 'package:html/parser.dart';

import 'package:sakai_mobile/yamanekopack/function/debug.dart';

String? extractJson(String html) {
  try {
    final document = parse(html);
    final pre = document.body!.children.first;
    final json = pre.innerHtml;
    return json;
  } catch (e) {
    pudding('JsonExtractError');
    return null;
  }
}
