import 'dart:convert';

import 'package:sakai_mobile/class/api/announcement.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/class/api/attachment.dart';
import 'package:sakai_mobile/function/api/get_html.dart';
import 'package:sakai_mobile/function/extract_json.dart';

Future<List<Announcement>?> getAnnouncementList(String domain,
    {int n = 20}) async {
  // d = N not working
  final url = 'https://$domain/direct/announcement/user.json?n=$n';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final announcementList = jsonDecodedMap['announcement_collection'];

    List<Announcement> result = [];
    for (final announcementMap in announcementList) {
      List<Attachment>? attachchmentList = [];

      if (announcementMap['attachments'] == null ||
          (announcementMap['attachments'] as List<dynamic>).isEmpty) {
        attachchmentList = null;
      } else {
        for (final attachmentMap
            in (announcementMap['attachments'] as List<dynamic>)) {
          attachchmentList.add(Attachment(
            name: attachmentMap['name'],
            type: attachmentMap['type'],
            url: attachmentMap['url'],
          ));
        }
      }

      result.add(Announcement(
        id: announcementMap['id'],
        title: announcementMap['title'],
        body: announcementMap['body'],
        createdOn: announcementMap['createdOn'],
        createdByDisplayName: announcementMap['createdByDisplayName'],
        attachmentList: attachchmentList,
      ));
    }
    return result;
  } catch (e) {
    pudding(e);
    return null;
  }
}

Future<List<Announcement>?> getSiteAnnouncementList(
    String siteId, String domain,
    {int n = 20}) async {
  final url = 'https://$domain/direct/announcement/site/$siteId.json?n=$n';

  try {
    final html = await getHtml(url);

    final json = extractJson(html);
    if (json == null) return null;

    final Map<String, dynamic> jsonDecodedMap = jsonDecode(json);
    final announcementList = jsonDecodedMap['announcement_collection'];

    List<Announcement> result = [];
    for (final announcementMap in announcementList) {
      List<Attachment>? attachchmentList = [];

      if (announcementMap['attachments'] == null ||
          (announcementMap['attachments'] as List<dynamic>).isEmpty) {
        attachchmentList = null;
      } else {
        for (final attachmentMap
            in (announcementMap['attachments'] as List<dynamic>)) {
          attachchmentList.add(Attachment(
            name: attachmentMap['name'],
            type: attachmentMap['type'],
            url: attachmentMap['url'],
          ));
        }
      }

      result.add(Announcement(
        id: announcementMap['id'],
        title: announcementMap['title'],
        body: announcementMap['body'],
        createdOn: announcementMap['createdOn'],
        createdByDisplayName: announcementMap['createdByDisplayName'],
        attachmentList: attachchmentList,
      ));
    }
    return result;
  } catch (e) {
    pudding(e);
    return null;
  }
}
