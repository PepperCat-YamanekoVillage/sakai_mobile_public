// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  return _Assignment.fromJson(json);
}

/// @nodoc
mixin _$Assignment {
  String? get title => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  bool? get hadSubmissions => throw _privateConstructorUsedError;
  int? get openTime => throw _privateConstructorUsedError; // not milli_seconds
  int? get dueTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignmentCopyWith<Assignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentCopyWith<$Res> {
  factory $AssignmentCopyWith(
          Assignment value, $Res Function(Assignment) then) =
      _$AssignmentCopyWithImpl<$Res, Assignment>;
  @useResult
  $Res call(
      {String? title,
      String? id,
      bool? hadSubmissions,
      int? openTime,
      int? dueTime});
}

/// @nodoc
class _$AssignmentCopyWithImpl<$Res, $Val extends Assignment>
    implements $AssignmentCopyWith<$Res> {
  _$AssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? hadSubmissions = freezed,
    Object? openTime = freezed,
    Object? dueTime = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      hadSubmissions: freezed == hadSubmissions
          ? _value.hadSubmissions
          : hadSubmissions // ignore: cast_nullable_to_non_nullable
              as bool?,
      openTime: freezed == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as int?,
      dueTime: freezed == dueTime
          ? _value.dueTime
          : dueTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignmentImplCopyWith<$Res>
    implements $AssignmentCopyWith<$Res> {
  factory _$$AssignmentImplCopyWith(
          _$AssignmentImpl value, $Res Function(_$AssignmentImpl) then) =
      __$$AssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? id,
      bool? hadSubmissions,
      int? openTime,
      int? dueTime});
}

/// @nodoc
class __$$AssignmentImplCopyWithImpl<$Res>
    extends _$AssignmentCopyWithImpl<$Res, _$AssignmentImpl>
    implements _$$AssignmentImplCopyWith<$Res> {
  __$$AssignmentImplCopyWithImpl(
      _$AssignmentImpl _value, $Res Function(_$AssignmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? id = freezed,
    Object? hadSubmissions = freezed,
    Object? openTime = freezed,
    Object? dueTime = freezed,
  }) {
    return _then(_$AssignmentImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      hadSubmissions: freezed == hadSubmissions
          ? _value.hadSubmissions
          : hadSubmissions // ignore: cast_nullable_to_non_nullable
              as bool?,
      openTime: freezed == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as int?,
      dueTime: freezed == dueTime
          ? _value.dueTime
          : dueTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignmentImpl extends _Assignment {
  const _$AssignmentImpl(
      {this.title, this.id, this.hadSubmissions, this.openTime, this.dueTime})
      : super._();

  factory _$AssignmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignmentImplFromJson(json);

  @override
  final String? title;
  @override
  final String? id;
  @override
  final bool? hadSubmissions;
  @override
  final int? openTime;
// not milli_seconds
  @override
  final int? dueTime;

  @override
  String toString() {
    return 'Assignment(title: $title, id: $id, hadSubmissions: $hadSubmissions, openTime: $openTime, dueTime: $dueTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hadSubmissions, hadSubmissions) ||
                other.hadSubmissions == hadSubmissions) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.dueTime, dueTime) || other.dueTime == dueTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, id, hadSubmissions, openTime, dueTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentImplCopyWith<_$AssignmentImpl> get copyWith =>
      __$$AssignmentImplCopyWithImpl<_$AssignmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignmentImplToJson(
      this,
    );
  }
}

abstract class _Assignment extends Assignment {
  const factory _Assignment(
      {final String? title,
      final String? id,
      final bool? hadSubmissions,
      final int? openTime,
      final int? dueTime}) = _$AssignmentImpl;
  const _Assignment._() : super._();

  factory _Assignment.fromJson(Map<String, dynamic> json) =
      _$AssignmentImpl.fromJson;

  @override
  String? get title;
  @override
  String? get id;
  @override
  bool? get hadSubmissions;
  @override
  int? get openTime;
  @override // not milli_seconds
  int? get dueTime;
  @override
  @JsonKey(ignore: true)
  _$$AssignmentImplCopyWith<_$AssignmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssignmentList _$AssignmentListFromJson(Map<String, dynamic> json) {
  return _AssignmentList.fromJson(json);
}

/// @nodoc
mixin _$AssignmentList {
  List<Assignment>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignmentListCopyWith<AssignmentList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentListCopyWith<$Res> {
  factory $AssignmentListCopyWith(
          AssignmentList value, $Res Function(AssignmentList) then) =
      _$AssignmentListCopyWithImpl<$Res, AssignmentList>;
  @useResult
  $Res call({List<Assignment>? body});
}

/// @nodoc
class _$AssignmentListCopyWithImpl<$Res, $Val extends AssignmentList>
    implements $AssignmentListCopyWith<$Res> {
  _$AssignmentListCopyWithImpl(this._value, this._then);

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
              as List<Assignment>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignmentListImplCopyWith<$Res>
    implements $AssignmentListCopyWith<$Res> {
  factory _$$AssignmentListImplCopyWith(_$AssignmentListImpl value,
          $Res Function(_$AssignmentListImpl) then) =
      __$$AssignmentListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Assignment>? body});
}

/// @nodoc
class __$$AssignmentListImplCopyWithImpl<$Res>
    extends _$AssignmentListCopyWithImpl<$Res, _$AssignmentListImpl>
    implements _$$AssignmentListImplCopyWith<$Res> {
  __$$AssignmentListImplCopyWithImpl(
      _$AssignmentListImpl _value, $Res Function(_$AssignmentListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_$AssignmentListImpl(
      body: freezed == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<Assignment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignmentListImpl extends _AssignmentList {
  const _$AssignmentListImpl({final List<Assignment>? body})
      : _body = body,
        super._();

  factory _$AssignmentListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignmentListImplFromJson(json);

  final List<Assignment>? _body;
  @override
  List<Assignment>? get body {
    final value = _body;
    if (value == null) return null;
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AssignmentList(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentListImpl &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentListImplCopyWith<_$AssignmentListImpl> get copyWith =>
      __$$AssignmentListImplCopyWithImpl<_$AssignmentListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignmentListImplToJson(
      this,
    );
  }
}

abstract class _AssignmentList extends AssignmentList {
  const factory _AssignmentList({final List<Assignment>? body}) =
      _$AssignmentListImpl;
  const _AssignmentList._() : super._();

  factory _AssignmentList.fromJson(Map<String, dynamic> json) =
      _$AssignmentListImpl.fromJson;

  @override
  List<Assignment>? get body;
  @override
  @JsonKey(ignore: true)
  _$$AssignmentListImplCopyWith<_$AssignmentListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
