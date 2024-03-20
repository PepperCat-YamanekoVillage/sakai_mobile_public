import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
class Site with _$Site {
  const Site._();

  const factory Site({
    String? id,
    String? title,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);

  void puddingAll() {
    pudding('Site-id: ${id ?? 'null'}');
    pudding('Site-title: ${title ?? 'null'}');
  }
}

@freezed
class SiteList with _$SiteList {
  @JsonSerializable(explicitToJson: true)
  const SiteList._();

  const factory SiteList({
    List<Site>? body,
  }) = _SiteList;

  factory SiteList.fromJson(Map<String, dynamic> json) =>
      _$SiteListFromJson(json);
}
