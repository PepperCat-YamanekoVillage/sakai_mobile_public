import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:sakai_mobile/class/api/announcement.dart';

class AnnouncementPage extends ConsumerWidget {
  final Announcement announcement;
  const AnnouncementPage({super.key, required this.announcement});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = announcement.title ?? '?';
    final body = announcement.body ?? '?';
    final author = announcement.createdByDisplayName ?? '?';
    final createdDate = announcement.createdOn;
    final attachmentList = announcement.attachmentList ?? [];

    final createdTimeStr = (createdDate != null)
        ? DateFormat().format(DateTime.fromMillisecondsSinceEpoch(createdDate))
        : '?';

    return Dismissible(
      key: const Key('announcement'),
      direction: DismissDirection.startToEnd,
      dragStartBehavior: DragStartBehavior.down,
      onDismissed: (_) => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28,
                        fontVariations: const [FontVariation('wght', 600)]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Text(
                    '${L10n.of(context)!.author}:  $author',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17,
                        fontVariations: const [FontVariation('wght', 500)]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Text(
                    createdTimeStr,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17,
                        fontVariations: const [FontVariation('wght', 500)]),
                  ),
                ),
                const SizedBox(height: 5),
                for (final attachment in attachmentList)
                  ListTile(
                    leading: const Icon(
                      Icons.attachment,
                      size: 20,
                    ),
                    title: Text(
                      attachment.name ?? '?',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          fontVariations: const [FontVariation('wght', 500)]),
                    ),
                    onTap: () {
                      final url = attachment.url;
                      if (url != null) {
                        launchUrl(Uri.parse(url),
                            mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                const SizedBox(height: 10),
                DefaultTextStyle(
                  style: const TextStyle(color: Colors.black),
                  child: Html(
                    data: _restoreHtml(body),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _restoreHtml(String html) {
  return html
      .replaceAll('&quot;', '"')
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&nbsp;', ' ');
}
