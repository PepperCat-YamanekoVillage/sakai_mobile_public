// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      eid: json['eid'] as String?,
      displayId: json['displayId'] as String?,
      maskedDisplayId: json['maskedDisplayId'] as String?,
      displayName: json['displayName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      sortName: json['sortName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eid': instance.eid,
      'displayId': instance.displayId,
      'maskedDisplayId': instance.maskedDisplayId,
      'displayName': instance.displayName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'sortName': instance.sortName,
      'email': instance.email,
    };
