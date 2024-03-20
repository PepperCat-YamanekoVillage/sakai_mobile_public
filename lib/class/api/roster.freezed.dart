// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Roster _$RosterFromJson(Map<String, dynamic> json) {
  return _Roster.fromJson(json);
}

/// @nodoc
mixin _$Roster {
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RosterCopyWith<Roster> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RosterCopyWith<$Res> {
  factory $RosterCopyWith(Roster value, $Res Function(Roster) then) =
      _$RosterCopyWithImpl<$Res, Roster>;
  @useResult
  $Res call({String? displayName});
}

/// @nodoc
class _$RosterCopyWithImpl<$Res, $Val extends Roster>
    implements $RosterCopyWith<$Res> {
  _$RosterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RosterImplCopyWith<$Res> implements $RosterCopyWith<$Res> {
  factory _$$RosterImplCopyWith(
          _$RosterImpl value, $Res Function(_$RosterImpl) then) =
      __$$RosterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? displayName});
}

/// @nodoc
class __$$RosterImplCopyWithImpl<$Res>
    extends _$RosterCopyWithImpl<$Res, _$RosterImpl>
    implements _$$RosterImplCopyWith<$Res> {
  __$$RosterImplCopyWithImpl(
      _$RosterImpl _value, $Res Function(_$RosterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
  }) {
    return _then(_$RosterImpl(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RosterImpl extends _Roster {
  const _$RosterImpl({this.displayName}) : super._();

  factory _$RosterImpl.fromJson(Map<String, dynamic> json) =>
      _$$RosterImplFromJson(json);

  @override
  final String? displayName;

  @override
  String toString() {
    return 'Roster(displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RosterImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RosterImplCopyWith<_$RosterImpl> get copyWith =>
      __$$RosterImplCopyWithImpl<_$RosterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RosterImplToJson(
      this,
    );
  }
}

abstract class _Roster extends Roster {
  const factory _Roster({final String? displayName}) = _$RosterImpl;
  const _Roster._() : super._();

  factory _Roster.fromJson(Map<String, dynamic> json) = _$RosterImpl.fromJson;

  @override
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$RosterImplCopyWith<_$RosterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
