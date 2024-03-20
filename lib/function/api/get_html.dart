import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<String> getHtml(String url) async {
  String? result;

  final webView = HeadlessInAppWebView(
    // CacheMode.LOAD_NO_CACHE for Android
    initialSettings: InAppWebViewSettings(cacheMode: CacheMode.LOAD_NO_CACHE),
    initialUrlRequest: URLRequest(
        url: WebUri(url),
        // URLRequestCachePolicy.RELOAD_IGNORING_LOCAL_CACHE_DATA for iOS
        cachePolicy: URLRequestCachePolicy.RELOAD_IGNORING_LOCAL_CACHE_DATA),
    onLoadStop: (controller, nowUrl) async {
      result = (await controller.getHtml()) ?? '';
    },
  );
  webView.run();

  while (result == null) {
    await Future.delayed(const Duration(milliseconds: 30));
  }
  webView.dispose();
  return result!;
}
