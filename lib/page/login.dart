import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sakai_mobile/page/sakai.dart';

import 'package:sakai_mobile/provider/url.dart';
import 'package:sakai_mobile/function/api/get_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends ConsumerWidget {
  final SharedPreferences pref;
  const LoginPage({super.key, required this.pref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final domain = ref.watch(domainProvider);
    if (domain == null) {
      return Dismissible(
        key: const Key(''),
        direction: DismissDirection.startToEnd,
        dragStartBehavior: DragStartBehavior.down,
        onDismissed: (_) => Navigator.pop(context),
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            resizeToAvoidBottomInset: false,
            body: Center(
                child: Text(
              L10n.of(context)!.please_enter_domain,
              style: const TextStyle(
                fontVariations: [FontVariation('wght', 500)],
              ),
            ))),
      );
    }

    final sakaiPortalUrl = 'https://$domain/portal';

    return Dismissible(
      key: const Key(''),
      direction: DismissDirection.startToEnd,
      dragStartBehavior: DragStartBehavior.down,
      onDismissed: (_) => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(sakaiPortalUrl)),
            initialSettings: InAppWebViewSettings(supportZoom: false),
            onLoadStart: (controller, url) async {
              final urlStr = url.toString();
              if (!(urlStr == sakaiPortalUrl ||
                  urlStr == '$sakaiPortalUrl/' ||
                  urlStr == '$sakaiPortalUrl#')) return;

              final session = await getSession(domain);
              if (session != null &&
                  session.userId != null &&
                  session.userId != '' &&
                  session.userId != 'null') {
                if (!(context.mounted)) return;
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: SakaiPage(pref: pref),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
