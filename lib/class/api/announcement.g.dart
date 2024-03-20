// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementImpl _$$AnnouncementImplFromJson(Map<String, dynamic> json) =>
    _$AnnouncementImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      createdOn: json['createdOn'] as int?,
      createdByDisplayName: json['createdByDisplayName'] as String?,
      attachmentList: (json['attachmentList'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnnouncementImplToJson(_$AnnouncementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'createdOn': instance.createdOn,
      'createdByDisplayName': instance.createdByDisplayName,
      'attachmentList': instance.attachmentList,
    };

_$AnnouncementListImpl _$$AnnouncementListImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementListImpl(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => Announcement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnnouncementListImplToJson(
        _$AnnouncementListImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
