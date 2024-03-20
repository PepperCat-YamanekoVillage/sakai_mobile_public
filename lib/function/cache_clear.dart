import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<void> cacheClear() async {
  bool isCompleted = false;

  final webView = HeadlessInAppWebView(
    initialSettings: InAppWebViewSettings(clearCache: true),
    initialUrlRequest: URLRequest(url: WebUri('')),
    onLoadStop: (_, __) async {
      isCompleted = true;
    },
  );
  webView.run();

  while (!isCompleted) {
    await Future.delayed(const Duration(milliseconds: 30));
  }
  webView.dispose();
  return;
}
