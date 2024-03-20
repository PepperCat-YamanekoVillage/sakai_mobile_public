import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

import 'package:sakai_mobile/class/api/attachment.dart';

part 'announcement.freezed.dart';
part 'announcement.g.dart';

@freezed
class Announcement with _$Announcement {
  @JsonSerializable(explicitToJson: true)
  const Announcement._();

  const factory Announcement({
    String? id,
    String? title,
    String? body,
    int? createdOn,
    String? createdByDisplayName,
    List<Attachment>? attachmentList,
  }) = _Announcement;

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  void puddingAll() {
    pudding('Announcement-id: ${id ?? 'null'}');
    pudding('Announcement-title: ${title ?? 'null'}');
    pudding('Announcement-body: ${body ?? 'null'}');
    pudding('Announcement-createdOn: ${createdOn ?? 'null'}');
    pudding(
        'Announcement-createdByDisplayName: ${createdByDisplayName ?? 'null'}');
    if (attachmentList == null) {
      pudding('Announcement-attachchment: null');
      return;
    }
    for (final attachment in attachmentList!) {
      attachment.puddingAll();
    }
  }
}

@freezed
class AnnouncementList with _$AnnouncementList {
  @JsonSerializable(explicitToJson: true)
  const AnnouncementList._();

  const factory AnnouncementList({
    List<Announcement>? body,
  }) = _AnnouncementList;

  factory AnnouncementList.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementListFromJson(json);
}
