// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResourceImpl _$$ResourceImplFromJson(Map<String, dynamic> json) =>
    _$ResourceImpl(
      author: json['author'] as String?,
      authorId: json['authorId'] as String?,
      container: json['container'] as String?,
      numChildren: json['numChildren'] as int?,
      modifiedDate: json['modifiedDate'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      webLinkUrl: json['webLinkUrl'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ResourceImplToJson(_$ResourceImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'authorId': instance.authorId,
      'container': instance.container,
      'numChildren': instance.numChildren,
      'modifiedDate': instance.modifiedDate,
      'title': instance.title,
      'type': instance.type,
      'webLinkUrl': instance.webLinkUrl,
      'url': instance.url,
    };

_$ResourceListImpl _$$ResourceListImplFromJson(Map<String, dynamic> json) =>
    _$ResourceListImpl(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResourceListImplToJson(_$ResourceListImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
