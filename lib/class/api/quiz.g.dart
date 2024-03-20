// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      title: json['title'] as String?,
      publishedAssessmentId: json['publishedAssessmentId'] as int?,
      startDate: json['startDate'] as int?,
      dueDate: json['dueDate'] as int?,
      submittedCount: json['submittedCount'] as int?,
      enrolledStudentCount: json['enrolledStudentCount'] as int?,
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'publishedAssessmentId': instance.publishedAssessmentId,
      'startDate': instance.startDate,
      'dueDate': instance.dueDate,
      'submittedCount': instance.submittedCount,
      'enrolledStudentCount': instance.enrolledStudentCount,
    };

_$QuizListImpl _$$QuizListImplFromJson(Map<String, dynamic> json) =>
    _$QuizListImpl(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizListImplToJson(_$QuizListImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
