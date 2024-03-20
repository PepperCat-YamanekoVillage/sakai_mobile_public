// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return _Resource.fromJson(json);
}

/// @nodoc
mixin _$Resource {
  String? get author => throw _privateConstructorUsedError;
  String? get authorId => throw _privateConstructorUsedError;
  String? get container => throw _privateConstructorUsedError;
  int? get numChildren => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get webLinkUrl => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourceCopyWith<Resource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<$Res> {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) then) =
      _$ResourceCopyWithImpl<$Res, Resource>;
  @useResult
  $Res call(
      {String? author,
      String? authorId,
      String? container,
      int? numChildren,
      String? modifiedDate,
      String? title,
      String? type,
      String? webLinkUrl,
      String? url});
}

/// @nodoc
class _$ResourceCopyWithImpl<$Res, $Val extends Resource>
    implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? authorId = freezed,
    Object? container = freezed,
    Object? numChildren = freezed,
    Object? modifiedDate = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? webLinkUrl = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      container: freezed == container
          ? _value.container
          : container // ignore: cast_nullable_to_non_nullable
              as String?,
      numChildren: freezed == numChildren
          ? _value.numChildren
          : numChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      webLinkUrl: freezed == webLinkUrl
          ? _value.webLinkUrl
          : webLinkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResourceImplCopyWith<$Res>
    implements $ResourceCopyWith<$Res> {
  factory _$$ResourceImplCopyWith(
          _$ResourceImpl value, $Res Function(_$ResourceImpl) then) =
      __$$ResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? author,
      String? authorId,
      String? container,
      int? numChildren,
      String? modifiedDate,
      String? title,
      String? type,
      String? webLinkUrl,
      String? url});
}

/// @nodoc
class __$$ResourceImplCopyWithImpl<$Res>
    extends _$ResourceCopyWithImpl<$Res, _$ResourceImpl>
    implements _$$ResourceImplCopyWith<$Res> {
  __$$ResourceImplCopyWithImpl(
      _$ResourceImpl _value, $Res Function(_$ResourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = freezed,
    Object? authorId = freezed,
    Object? container = freezed,
    Object? numChildren = freezed,
    Object? modifiedDate = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? webLinkUrl = freezed,
    Object? url = freezed,
  }) {
    return _then(_$ResourceImpl(
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      container: freezed == container
          ? _value.container
          : container // ignore: cast_nullable_to_non_nullable
              as String?,
      numChildren: freezed == numChildren
          ? _value.numChildren
          : numChildren // ignore: cast_nullable_to_non_nullable
              as int?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      webLinkUrl: freezed == webLinkUrl
          ? _value.webLinkUrl
          : webLinkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResourceImpl extends _Resource {
  const _$ResourceImpl(
      {this.author,
      this.authorId,
      this.container,
      this.numChildren,
      this.modifiedDate,
      this.title,
      this.type,
      this.webLinkUrl,
      this.url})
      : super._();

  factory _$ResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResourceImplFromJson(json);

  @override
  final String? author;
  @override
  final String? authorId;
  @override
  final String? container;
  @override
  final int? numChildren;
  @override
  final String? modifiedDate;
  @override
  final String? title;
  @override
  final String? type;
  @override
  final String? webLinkUrl;
  @override
  final String? url;

  @override
  String toString() {
    return 'Resource(author: $author, authorId: $authorId, container: $container, numChildren: $numChildren, modifiedDate: $modifiedDate, title: $title, type: $type, webLinkUrl: $webLinkUrl, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceImpl &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.container, container) ||
                other.container == container) &&
            (identical(other.numChildren, numChildren) ||
                other.numChildren == numChildren) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.webLinkUrl, webLinkUrl) ||
                other.webLinkUrl == webLinkUrl) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, authorId, container,
      numChildren, modifiedDate, title, type, webLinkUrl, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      __$$ResourceImplCopyWithImpl<_$ResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResourceImplToJson(
      this,
    );
  }
}

abstract class _Resource extends Resource {
  const factory _Resource(
      {final String? author,
      final String? authorId,
      final String? container,
      final int? numChildren,
      final String? modifiedDate,
      final String? title,
      final String? type,
      final String? webLinkUrl,
      final String? url}) = _$ResourceImpl;
  const _Resource._() : super._();

  factory _Resource.fromJson(Map<String, dynamic> json) =
      _$ResourceImpl.fromJson;

  @override
  String? get author;
  @override
  String? get authorId;
  @override
  String? get container;
  @override
  int? get numChildren;
  @override
  String? get modifiedDate;
  @override
  String? get title;
  @override
  String? get type;
  @override
  String? get webLinkUrl;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$ResourceImplCopyWith<_$ResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResourceList _$ResourceListFromJson(Map<String, dynamic> json) {
  return _ResourceList.fromJson(json);
}

/// @nodoc
mixin _$ResourceList {
  List<Resource>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourceListCopyWith<ResourceList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceListCopyWith<$Res> {
  factory $ResourceListCopyWith(
          ResourceList value, $Res Function(ResourceList) then) =
      _$ResourceListCopyWithImpl<$Res, ResourceList>;
  @useResult
  $Res call({List<Resource>? body});
}

/// @nodoc
class _$ResourceListCopyWithImpl<$Res, $Val extends ResourceList>
    implements $ResourceListCopyWith<$Res> {
  _$ResourceListCopyWithImpl(this._value, this._then);

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
              as List<Resource>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResourceListImplCopyWith<$Res>
    implements $ResourceListCopyWith<$Res> {
  factory _$$ResourceListImplCopyWith(
          _$ResourceListImpl value, $Res Function(_$ResourceListImpl) then) =
      __$$ResourceListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Resource>? body});
}

/// @nodoc
class __$$ResourceListImplCopyWithImpl<$Res>
    extends _$ResourceListCopyWithImpl<$Res, _$ResourceListImpl>
    implements _$$ResourceListImplCopyWith<$Res> {
  __$$ResourceListImplCopyWithImpl(
      _$ResourceListImpl _value, $Res Function(_$ResourceListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_$ResourceListImpl(
      body: freezed == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<Resource>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResourceListImpl extends _ResourceList {
  const _$ResourceListImpl({final List<Resource>? body})
      : _body = body,
        super._();

  factory _$ResourceListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResourceListImplFromJson(json);

  final List<Resource>? _body;
  @override
  List<Resource>? get body {
    final value = _body;
    if (value == null) return null;
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResourceList(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceListImpl &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceListImplCopyWith<_$ResourceListImpl> get copyWith =>
      __$$ResourceListImplCopyWithImpl<_$ResourceListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResourceListImplToJson(
      this,
    );
  }
}

abstract class _ResourceList extends ResourceList {
  const factory _ResourceList({final List<Resource>? body}) =
      _$ResourceListImpl;
  const _ResourceList._() : super._();

  factory _ResourceList.fromJson(Map<String, dynamic> json) =
      _$ResourceListImpl.fromJson;

  @override
  List<Resource>? get body;
  @override
  @JsonKey(ignore: true)
  _$$ResourceListImplCopyWith<_$ResourceListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
