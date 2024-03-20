import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  const Session._();

  const factory Session({
    String? userId,
    String? userEid,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  void puddingAll() {
    pudding('Session-userId: ${userId ?? 'null'}');
    pudding('Session-userEid: ${userEid ?? 'null'}');
  }
}
