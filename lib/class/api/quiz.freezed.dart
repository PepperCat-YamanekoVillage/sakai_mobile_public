// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  String? get title => throw _privateConstructorUsedError;
  int? get publishedAssessmentId => throw _privateConstructorUsedError;
  int? get startDate => throw _privateConstructorUsedError;
  int? get dueDate => throw _privateConstructorUsedError;
  int? get submittedCount => throw _privateConstructorUsedError;
  int? get enrolledStudentCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {String? title,
      int? publishedAssessmentId,
      int? startDate,
      int? dueDate,
      int? submittedCount,
      int? enrolledStudentCount});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? publishedAssessmentId = freezed,
    Object? startDate = freezed,
    Object? dueDate = freezed,
    Object? submittedCount = freezed,
    Object? enrolledStudentCount = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAssessmentId: freezed == publishedAssessmentId
          ? _value.publishedAssessmentId
          : publishedAssessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedCount: freezed == submittedCount
          ? _value.submittedCount
          : submittedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      enrolledStudentCount: freezed == enrolledStudentCount
          ? _value.enrolledStudentCount
          : enrolledStudentCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      int? publishedAssessmentId,
      int? startDate,
      int? dueDate,
      int? submittedCount,
      int? enrolledStudentCount});
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? publishedAssessmentId = freezed,
    Object? startDate = freezed,
    Object? dueDate = freezed,
    Object? submittedCount = freezed,
    Object? enrolledStudentCount = freezed,
  }) {
    return _then(_$QuizImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAssessmentId: freezed == publishedAssessmentId
          ? _value.publishedAssessmentId
          : publishedAssessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedCount: freezed == submittedCount
          ? _value.submittedCount
          : submittedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      enrolledStudentCount: freezed == enrolledStudentCount
          ? _value.enrolledStudentCount
          : enrolledStudentCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizImpl extends _Quiz {
  const _$QuizImpl(
      {this.title,
      this.publishedAssessmentId,
      this.startDate,
      this.dueDate,
      this.submittedCount,
      this.enrolledStudentCount})
      : super._();

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  final String? title;
  @override
  final int? publishedAssessmentId;
  @override
  final int? startDate;
  @override
  final int? dueDate;
  @override
  final int? submittedCount;
  @override
  final int? enrolledStudentCount;

  @override
  String toString() {
    return 'Quiz(title: $title, publishedAssessmentId: $publishedAssessmentId, startDate: $startDate, dueDate: $dueDate, submittedCount: $submittedCount, enrolledStudentCount: $enrolledStudentCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.publishedAssessmentId, publishedAssessmentId) ||
                other.publishedAssessmentId == publishedAssessmentId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.submittedCount, submittedCount) ||
                other.submittedCount == submittedCount) &&
            (identical(other.enrolledStudentCount, enrolledStudentCount) ||
                other.enrolledStudentCount == enrolledStudentCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, publishedAssessmentId,
      startDate, dueDate, submittedCount, enrolledStudentCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizImplToJson(
      this,
    );
  }
}

abstract class _Quiz extends Quiz {
  const factory _Quiz(
      {final String? title,
      final int? publishedAssessmentId,
      final int? startDate,
      final int? dueDate,
      final int? submittedCount,
      final int? enrolledStudentCount}) = _$QuizImpl;
  const _Quiz._() : super._();

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  String? get title;
  @override
  int? get publishedAssessmentId;
  @override
  int? get startDate;
  @override
  int? get dueDate;
  @override
  int? get submittedCount;
  @override
  int? get enrolledStudentCount;
  @override
  @JsonKey(ignore: true)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizList _$QuizListFromJson(Map<String, dynamic> json) {
  return _QuizList.fromJson(json);
}

/// @nodoc
mixin _$QuizList {
  List<Quiz>? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizListCopyWith<QuizList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizListCopyWith<$Res> {
  factory $QuizListCopyWith(QuizList value, $Res Function(QuizList) then) =
      _$QuizListCopyWithImpl<$Res, QuizList>;
  @useResult
  $Res call({List<Quiz>? body});
}

/// @nodoc
class _$QuizListCopyWithImpl<$Res, $Val extends QuizList>
    implements $QuizListCopyWith<$Res> {
  _$QuizListCopyWithImpl(this._value, this._then);

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
              as List<Quiz>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizListImplCopyWith<$Res>
    implements $QuizListCopyWith<$Res> {
  factory _$$QuizListImplCopyWith(
          _$QuizListImpl value, $Res Function(_$QuizListImpl) then) =
      __$$QuizListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Quiz>? body});
}

/// @nodoc
class __$$QuizListImplCopyWithImpl<$Res>
    extends _$QuizListCopyWithImpl<$Res, _$QuizListImpl>
    implements _$$QuizListImplCopyWith<$Res> {
  __$$QuizListImplCopyWithImpl(
      _$QuizListImpl _value, $Res Function(_$QuizListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
  }) {
    return _then(_$QuizListImpl(
      body: freezed == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<Quiz>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizListImpl extends _QuizList {
  const _$QuizListImpl({final List<Quiz>? body})
      : _body = body,
        super._();

  factory _$QuizListImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizListImplFromJson(json);

  final List<Quiz>? _body;
  @override
  List<Quiz>? get body {
    final value = _body;
    if (value == null) return null;
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuizList(body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizListImpl &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizListImplCopyWith<_$QuizListImpl> get copyWith =>
      __$$QuizListImplCopyWithImpl<_$QuizListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizListImplToJson(
      this,
    );
  }
}

abstract class _QuizList extends QuizList {
  const factory _QuizList({final List<Quiz>? body}) = _$QuizListImpl;
  const _QuizList._() : super._();

  factory _QuizList.fromJson(Map<String, dynamic> json) =
      _$QuizListImpl.fromJson;

  @override
  List<Quiz>? get body;
  @override
  @JsonKey(ignore: true)
  _$$QuizListImplCopyWith<_$QuizListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
