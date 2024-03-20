import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

part 'roster.freezed.dart';
part 'roster.g.dart';

@freezed
class Roster with _$Roster {
  const Roster._();

  const factory Roster({
    String? displayName,
  }) = _Roster;

  factory Roster.fromJson(Map<String, dynamic> json) => _$RosterFromJson(json);

  void puddingAll() {
    pudding('Roster-displayName: ${displayName ?? 'null'}');
  }
}
