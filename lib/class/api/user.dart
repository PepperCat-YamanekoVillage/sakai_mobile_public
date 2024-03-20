import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    String? id,
    String? eid,
    String? displayId,
    String? maskedDisplayId,
    String? displayName,
    String? firstName,
    String? lastName,
    String? sortName,
    String? email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  void puddingAll() {
    pudding('User-id: ${id ?? 'null'}');
    pudding('User-eid: ${eid ?? 'null'}');
    pudding('User-displayId: ${displayId ?? 'null'}');
    pudding('User-maskedDisplayId: ${maskedDisplayId ?? 'null'}');
    pudding('User-displayName: ${displayName ?? 'null'}');
    pudding('User-firstName: ${firstName ?? 'null'}');
    pudding('User-lastName: ${lastName ?? 'null'}');
    pudding('User-sortName: ${sortName ?? 'null'}');
    pudding('User-email: ${email ?? 'null'}');
  }
}
