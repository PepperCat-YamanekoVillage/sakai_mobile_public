// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteImpl _$$SiteImplFromJson(Map<String, dynamic> json) => _$SiteImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$SiteImplToJson(_$SiteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$SiteListImpl _$$SiteListImplFromJson(Map<String, dynamic> json) =>
    _$SiteListImpl(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => Site.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SiteListImplToJson(_$SiteListImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
