import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const Quiz._();

  const factory Quiz({
    String? title,
    int? publishedAssessmentId,
    int? startDate,
    int? dueDate,
    int? submittedCount,
    int? enrolledStudentCount,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  void puddingAll() {
    pudding('Quiz-title: ${title ?? 'null'}');
    pudding('Quiz-publishedAssessmentId: ${publishedAssessmentId ?? 'null'}');
    pudding('Quiz-startDate: ${startDate ?? 'null'}');
    pudding('Quiz-dueDate: ${dueDate ?? 'null'}');
    pudding('Quiz-submittedCount: ${submittedCount ?? 'null'}');
    pudding('Quiz-enrolledStudentCount: ${enrolledStudentCount ?? 'null'}');
  }
}

@freezed
class QuizList with _$QuizList {
  @JsonSerializable(explicitToJson: true)
  const QuizList._();

  const factory QuizList({
    List<Quiz>? body,
  }) = _QuizList;

  factory QuizList.fromJson(Map<String, dynamic> json) =>
      _$QuizListFromJson(json);
}
