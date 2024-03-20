import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/url.dart';

class TransitionPage extends ConsumerWidget {
  const TransitionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    const tileColor = null;
    final textColor = theme.dividerColor;
    const minVerticalPadding = 18.0;
    final textStyle = TextStyle(
        fontSize: 72.sp, fontVariations: const [FontVariation('wght', 400)]);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            color: theme.dividerColor,
            tiles: [
              ListTile(
                tileColor: tileColor,
                textColor: textColor,
                minVerticalPadding: minVerticalPadding,
                title: Text(
                  L10n.of(context)!.license,
                  style: textStyle,
                ),
                onTap: () {
                  showLicensePage(context: context);
                },
              ),
              ListTile(
                tileColor: tileColor,
                textColor: textColor,
                minVerticalPadding: minVerticalPadding,
                title: Text(
                  L10n.of(context)!.privacy_policy,
                  style: textStyle,
                ),
                onTap: () {
                  launchUrl(Uri.parse(privacyPolicyUrl),
                      mode: LaunchMode.externalApplication);
                },
              ),
              ListTile(
                tileColor: tileColor,
                textColor: textColor,
                minVerticalPadding: minVerticalPadding,
                title: Text(
                  L10n.of(context)!.defect_report,
                  style: textStyle,
                ),
                onTap: () {
                  launchUrl(Uri.parse(defectReportUrl),
                      mode: LaunchMode.externalApplication);
                },
              ),
            ],
          ).toList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.scaffoldBackgroundColor,
        shape: CircleBorder(
            side: BorderSide(color: theme.primaryColor, width: 5.0)),
        child: Icon(
          Icons.menu,
          color: theme.primaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
