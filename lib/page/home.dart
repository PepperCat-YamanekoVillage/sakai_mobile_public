import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: unused_import
import '../yamanekopack/function/debug.dart';
import '../const/url.dart';

import 'transition.dart';

import 'package:sakai_mobile/page/login.dart';
import 'package:sakai_mobile/component/gradient_button.dart';
import 'package:sakai_mobile/provider/url.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool wasCheckSession = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: ScreenUtilInit(
          designSize: const Size(900, 1600),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final pref = snapshot.data;
                  if (pref == null) return Container();

                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    ref.read(domainProvider.notifier).init(pref);

                    // 起動時 sessionが確認できた場合 SakaiPageに遷移する
                    /*
                    if (wasCheckSession) return;
                    wasCheckSession = true;
                    if (pref.getString('domain') == null) return;
                    final session = await getSession(pref.getString('domain')!);
                    if (session != null &&
                        session.userId != null &&
                        session.userId != '' &&
                        session.userId != 'null') {
                      if (!(context.mounted)) return;
                      if (!(ModalRoute.of(context)!.isCurrent)) return;
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SakaiPage(pref: pref),
                        ),
                      );
                    }*/
                  });

                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                            height: 30, width: 280, child: _DomainText()),
                        const SizedBox(height: 25),
                        GradientButton(
                            height: 60,
                            width: 180,
                            color1: Colors.blue,
                            color2: Colors.black,
                            text: L10n.of(context)!.login,
                            onTap: () => Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: LoginPage(pref: pref),
                                  ),
                                )),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            launchUrl(Uri.parse(privacyPolicyUrl),
                                mode: LaunchMode.externalApplication);
                          },
                          child: Text(
                            L10n.of(context)!.by_click_pp,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: CircleBorder(
            side:
                BorderSide(color: Theme.of(context).primaryColor, width: 5.0)),
        child: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.topToBottom,
              child: const TransitionPage(),
            ),
          );
        },
      ),
    );
  }
}

class _DomainText extends ConsumerWidget {
  const _DomainText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final domain = ref.watch(domainProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_editedDomain != null && _editedDomain != domain) {
        ref.read(domainProvider.notifier).update(_editedDomain!);
      }
    });

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        final controller = TextEditingController();
        if (domain != null) controller.text = domain;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: TextField(
                  controller: controller,
                  autofocus: true,
                  autocorrect: false,
                  style: const TextStyle(
                    fontVariations: [FontVariation('wght', 500)],
                  ),
                  onSubmitted: (_) {
                    {
                      if (controller.text == '') return;
                      _editedDomain = controller.text;
                    }
                  },
                ),
              );
            }).then((_) {
          if (controller.text == '') return;
          _editedDomain = controller.text;
        });
      },
      child: AutoSizeText(
        domain ?? L10n.of(context)!.please_enter_domain,
        textAlign: TextAlign.center,
        maxLines: 1,
        style: const TextStyle(
            fontSize: 1000,
            fontVariations: [FontVariation('wght', 600)],
            decoration: TextDecoration.underline),
      ),
    );
  }
}

String? _editedDomain;
