import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sakai_mobile/yamanekopack/function/debug.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
class Resource with _$Resource {
  const Resource._();

  const factory Resource({
    String? author,
    String? authorId,
    String? container,
    int? numChildren,
    String? modifiedDate,
    String? title,
    String? type,
    String? webLinkUrl,
    String? url,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  void puddingAll() {
    pudding('Resource-author: ${author ?? 'null'}');
    pudding('Resource-authorId: ${authorId ?? 'null'}');
    pudding('Resource-container: ${container ?? 'null'}');
    pudding('Resource-numChildren: ${numChildren ?? 'null'}');
    pudding('Resource-modifiedDate: ${modifiedDate ?? 'null'}');
    pudding('Resource-title: ${title ?? 'null'}');
    pudding('Resource-type: ${type ?? 'null'}');
    pudding('Resource-webLinkUrl: ${webLinkUrl ?? 'null'}');
    pudding('Resource-url: ${url ?? 'null'}');
  }
}

@freezed
class ResourceList with _$ResourceList {
  @JsonSerializable(explicitToJson: true)
  const ResourceList._();

  const factory ResourceList({
    List<Resource>? body,
  }) = _ResourceList;

  factory ResourceList.fromJson(Map<String, dynamic> json) =>
      _$ResourceListFromJson(json);
}
