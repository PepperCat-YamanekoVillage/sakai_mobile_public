// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignmentImpl _$$AssignmentImplFromJson(Map<String, dynamic> json) =>
    _$AssignmentImpl(
      title: json['title'] as String?,
      id: json['id'] as String?,
      hadSubmissions: json['hadSubmissions'] as bool?,
      openTime: json['openTime'] as int?,
      dueTime: json['dueTime'] as int?,
    );

Map<String, dynamic> _$$AssignmentImplToJson(_$AssignmentImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'hadSubmissions': instance.hadSubmissions,
      'openTime': instance.openTime,
      'dueTime': instance.dueTime,
    };

_$AssignmentListImpl _$$AssignmentListImplFromJson(Map<String, dynamic> json) =>
    _$AssignmentListImpl(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => Assignment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssignmentListImplToJson(
        _$AssignmentListImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
