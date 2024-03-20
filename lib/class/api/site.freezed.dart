// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Site _$SiteFromJson(Map<String, dynamic> json) {
  return _Site.fromJson(json);
}

/// @nodoc
mixin _$Site {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteCopyWith<Site> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteCopyWith<$Res> {
  factory $SiteCopyWith(Site value, $Res Function(Site) then) =
      _$SiteCopyWithImpl<$Res, Site>;
  @useResult
  $Res call({String? id, String? title});
}

/// @nodoc
class _$SiteCopyWithImpl<$Res, $Val extends Site>
    implements $SiteCopyWith<$Res> {
  _$SiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiteImplCopyWith<$Res> implements $SiteCopyWith<$Res> {
  factory _$$SiteImplCopyWith(
          _$SiteImpl value, $Res Function(_$SiteImpl) then) =
      __$$SiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? title});
}

/// @nodoc
class __$$SiteImplCopyWithImpl<$Res>
    extends _$SiteCopyWithImpl<$Res, _$SiteImpl>
    implements _$$SiteImplCopyWith<$Res> {
  __$$SiteImplCopyWithImpl(_$SiteImpl _value, $Res Function(_$SiteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$SiteImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteImpl extends _Site {
  const _$SiteImpl({this.id, this.title}) : super._();

  factory _$SiteImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;

  @override
  String toString() {
    return 'Site(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteImplCopyWith<_$SiteImpl> get copyWith =>
      __$$SiteImplCopyWithImpl<_$SiteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteImplToJson(
      this,
    );
  }
}

abstract class _Site extends Site {
  const factory _Site({final String? id, final String? title}) = _$SiteImpl;
  const _Site._() : super._();

  factory _Site.fromJson(Map<String, dynamic> json) = _$SiteImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$SiteImplCopyWith<_$SiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SiteList _$SiteListFromJson(Map<String, dynamic> json) {
  return _SiteList.fromJson(json);
}

/// @nodoc
mixin _$SiteList {
  List<Site>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteListCopyWith<SiteList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteListCopyWith<$Res> {
  factory $SiteListCopyWith(SiteList value, $Res Function(SiteList) then) =
      _$SiteListCopyWithImpl<$Res, SiteList>;
  @useResult
  $Res call({List<Site>? body});
}

/// @nodoc
class _$SiteListCopyWithImpl<$Res, $Val extends SiteList>
    implements $SiteListCopyWith<$Res> {
  _$SiteListCopyWithImpl(this._value, this._then);

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
              as List<Site>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiteListImplCopyWith<$Res>
    implements $SiteListCopyWith<$Res> {
  factory _$$SiteListImplCopyWith(
          _$SiteListImpl value, $Res Function(_$SiteListImpl) then) =
      __$$SiteListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Site>? body});
}

/// @nodoc
class __$$SiteListImplCopyWithImpl<$Res>
    extends _$SiteListCopyWithImpl<$Res, _$SiteListImpl>
    implements _$$SiteListImplCopyWith<$Res> {
  __$$SiteListImplCopyWithImpl(
      _$SiteListImpl _value, $Res Function(_$SiteListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_$SiteListImpl(
      body: freezed == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<Site>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteListImpl extends _SiteList {
  const _$SiteListImpl({final List<Site>? body})
      : _body = body,
        super._();

  factory _$SiteListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteListImplFromJson(json);

  final List<Site>? _body;
  @override
  List<Site>? get body {
    final value = _body;
    if (value == null) return null;
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SiteList(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteListImpl &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteListImplCopyWith<_$SiteListImpl> get copyWith =>
      __$$SiteListImplCopyWithImpl<_$SiteListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteListImplToJson(
      this,
    );
  }
}

abstract class _SiteList extends SiteList {
  const factory _SiteList({final List<Site>? body}) = _$SiteListImpl;
  const _SiteList._() : super._();

  factory _SiteList.fromJson(Map<String, dynamic> json) =
      _$SiteListImpl.fromJson;

  @override
  List<Site>? get body;
  @override
  @JsonKey(ignore: true)
  _$$SiteListImplCopyWith<_$SiteListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
