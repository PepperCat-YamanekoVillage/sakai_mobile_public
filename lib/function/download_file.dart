import 'dart:io';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:mime_type/mime_type.dart';

final cookieManeger = CookieManager.instance();

Future<(XFile, File)> downloadFile(
    String url, String mimeType, String name) async {
  String cookieStr = '';

  List<Cookie> cookies = await cookieManeger.getCookies(url: WebUri(url));

  for (final cookie in cookies) {
    final name = cookie.name;
    final value = cookie.value;

    if (cookieStr != '') {
      cookieStr = '$cookieStr; ';
    }
    cookieStr = '$cookieStr$name=$value';
  }

  final res = await http.get(Uri.parse(url), headers: {'Cookie': cookieStr});

  final bytes = res.bodyBytes;

  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/${joinExtention(name, mimeType)}';

  final file = File(path);
  await file.writeAsBytes(bytes);

  final xfile = XFile(path, mimeType: mimeType);

  return (xfile, file);
}

String joinExtention(String name, String mimeType) {
  final ext = extensionFromMime(mimeType);
  if (ext == null) return name;
  if (RegExp(r'\.[^\.]+$').hasMatch(name)) {
    return name;
  } else {
    return '$name.$ext';
  }
}
