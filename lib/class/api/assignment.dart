import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

part 'assignment.freezed.dart';
part 'assignment.g.dart';

@freezed
class Assignment with _$Assignment {
  const Assignment._();

  const factory Assignment({
    String? title,
    String? id,
    bool? hadSubmissions,
    int? openTime, // not milli_seconds
    int? dueTime, // not milli_seconds
  }) = _Assignment;

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);

  void puddingAll() {
    pudding('Assignment-title: ${title ?? 'null'}');
    pudding('Assignment-id: ${id ?? 'null'}');
    pudding('Assignment-hadSubmissions: ${hadSubmissions ?? 'null'}');
    pudding('Assignment-openTime: ${openTime ?? 'null'}');
    pudding('Assignment-dueTime: ${dueTime ?? 'null'}');
  }
}

@freezed
class AssignmentList with _$AssignmentList {
  @JsonSerializable(explicitToJson: true)
  const AssignmentList._();

  const factory AssignmentList({
    List<Assignment>? body,
  }) = _AssignmentList;

  factory AssignmentList.fromJson(Map<String, dynamic> json) =>
      _$AssignmentListFromJson(json);
}
