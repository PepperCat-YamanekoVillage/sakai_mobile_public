import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  const Attachment._();

  const factory Attachment({
    String? name,
    String? type,
    String? url,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  void puddingAll() {
    pudding('Attachment-name: ${name ?? 'null'}');
    pudding('Attachment-type: ${type ?? 'null'}');
    pudding('Attachment-url: ${url ?? 'null'}');
  }
}
