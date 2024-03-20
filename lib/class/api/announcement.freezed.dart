// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) {
  return _Announcement.fromJson(json);
}

/// @nodoc
mixin _$Announcement {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  int? get createdOn => throw _privateConstructorUsedError;
  String? get createdByDisplayName => throw _privateConstructorUsedError;
  List<Attachment>? get attachmentList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementCopyWith<Announcement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementCopyWith<$Res> {
  factory $AnnouncementCopyWith(
          Announcement value, $Res Function(Announcement) then) =
      _$AnnouncementCopyWithImpl<$Res, Announcement>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? body,
      int? createdOn,
      String? createdByDisplayName,
      List<Attachment>? attachmentList});
}

/// @nodoc
class _$AnnouncementCopyWithImpl<$Res, $Val extends Announcement>
    implements $AnnouncementCopyWith<$Res> {
  _$AnnouncementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? createdOn = freezed,
    Object? createdByDisplayName = freezed,
    Object? attachmentList = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByDisplayName: freezed == createdByDisplayName
          ? _value.createdByDisplayName
          : createdByDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentList: freezed == attachmentList
          ? _value.attachmentList
          : attachmentList // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementImplCopyWith<$Res>
    implements $AnnouncementCopyWith<$Res> {
  factory _$$AnnouncementImplCopyWith(
          _$AnnouncementImpl value, $Res Function(_$AnnouncementImpl) then) =
      __$$AnnouncementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? body,
      int? createdOn,
      String? createdByDisplayName,
      List<Attachment>? attachmentList});
}

/// @nodoc
class __$$AnnouncementImplCopyWithImpl<$Res>
    extends _$AnnouncementCopyWithImpl<$Res, _$AnnouncementImpl>
    implements _$$AnnouncementImplCopyWith<$Res> {
  __$$AnnouncementImplCopyWithImpl(
      _$AnnouncementImpl _value, $Res Function(_$AnnouncementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? createdOn = freezed,
    Object? createdByDisplayName = freezed,
    Object? attachmentList = freezed,
  }) {
    return _then(_$AnnouncementImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as int?,
      createdByDisplayName: freezed == createdByDisplayName
          ? _value.createdByDisplayName
          : createdByDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentList: freezed == attachmentList
          ? _value._attachmentList
          : attachmentList // ignore: cast_nullable_to_non_nullable
              as List<Attachment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnouncementImpl extends _Announcement {
  const _$AnnouncementImpl(
      {this.id,
      this.title,
      this.body,
      this.createdOn,
      this.createdByDisplayName,
      final List<Attachment>? attachmentList})
      : _attachmentList = attachmentList,
        super._();

  factory _$AnnouncementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnouncementImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final int? createdOn;
  @override
  final String? createdByDisplayName;
  final List<Attachment>? _attachmentList;
  @override
  List<Attachment>? get attachmentList {
    final value = _attachmentList;
    if (value == null) return null;
    if (_attachmentList is EqualUnmodifiableListView) return _attachmentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Announcement(id: $id, title: $title, body: $body, createdOn: $createdOn, createdByDisplayName: $createdByDisplayName, attachmentList: $attachmentList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.createdByDisplayName, createdByDisplayName) ||
                other.createdByDisplayName == createdByDisplayName) &&
            const DeepCollectionEquality()
                .equals(other._attachmentList, _attachmentList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      body,
      createdOn,
      createdByDisplayName,
      const DeepCollectionEquality().hash(_attachmentList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementImplCopyWith<_$AnnouncementImpl> get copyWith =>
      __$$AnnouncementImplCopyWithImpl<_$AnnouncementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementImplToJson(
      this,
    );
  }
}

abstract class _Announcement extends Announcement {
  const factory _Announcement(
      {final String? id,
      final String? title,
      final String? body,
      final int? createdOn,
      final String? createdByDisplayName,
      final List<Attachment>? attachmentList}) = _$AnnouncementImpl;
  const _Announcement._() : super._();

  factory _Announcement.fromJson(Map<String, dynamic> json) =
      _$AnnouncementImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get body;
  @override
  int? get createdOn;
  @override
  String? get createdByDisplayName;
  @override
  List<Attachment>? get attachmentList;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementImplCopyWith<_$AnnouncementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnnouncementList _$AnnouncementListFromJson(Map<String, dynamic> json) {
  return _AnnouncementList.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementList {
  List<Announcement>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementListCopyWith<AnnouncementList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementListCopyWith<$Res> {
  factory $AnnouncementListCopyWith(
          AnnouncementList value, $Res Function(AnnouncementList) then) =
      _$AnnouncementListCopyWithImpl<$Res, AnnouncementList>;
  @useResult
  $Res call({List<Announcement>? body});
}

/// @nodoc
class _$AnnouncementListCopyWithImpl<$Res, $Val extends AnnouncementList>
    implements $AnnouncementListCopyWith<$Res> {
  _$AnnouncementListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as List<Announcement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementListImplCopyWith<$Res>
    implements $AnnouncementListCopyWith<$Res> {
  factory _$$AnnouncementListImplCopyWith(_$AnnouncementListImpl value,
          $Res Function(_$AnnouncementListImpl) then) =
      __$$AnnouncementListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Announcement>? body});
}

/// @nodoc
class __$$AnnouncementListImplCopyWithImpl<$Res>
    extends _$AnnouncementListCopyWithImpl<$Res, _$AnnouncementListImpl>
    implements _$$AnnouncementListImplCopyWith<$Res> {
  __$$AnnouncementListImplCopyWithImpl(_$AnnouncementListImpl _value,
      $Res Function(_$AnnouncementListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_$AnnouncementListImpl(
      body: freezed == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<Announcement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnouncementListImpl extends _AnnouncementList {
  const _$AnnouncementListImpl({final List<Announcement>? body})
      : _body = body,
        super._();

  factory _$AnnouncementListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnouncementListImplFromJson(json);

  final List<Announcement>? _body;
  @override
  List<Announcement>? get body {
    final value = _body;
    if (value == null) return null;
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AnnouncementList(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementListImpl &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementListImplCopyWith<_$AnnouncementListImpl> get copyWith =>
      __$$AnnouncementListImplCopyWithImpl<_$AnnouncementListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnouncementListImplToJson(
      this,
    );
  }
}

abstract class _AnnouncementList extends AnnouncementList {
  const factory _AnnouncementList({final List<Announcement>? body}) =
      _$AnnouncementListImpl;
  const _AnnouncementList._() : super._();

  factory _AnnouncementList.fromJson(Map<String, dynamic> json) =
      _$AnnouncementListImpl.fromJson;

  @override
  List<Announcement>? get body;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementListImplCopyWith<_$AnnouncementListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
