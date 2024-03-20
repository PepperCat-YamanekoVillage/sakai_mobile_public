import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sakai_mobile/const/cache_policy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import 'package:sakai_mobile/class/api/resource.dart';
import 'package:sakai_mobile/class/provider/api/resource_list.dart';
import 'package:sakai_mobile/class/view/site_list_with_one_site_details_slider_view.dart';
import 'package:sakai_mobile/const/mime_type.dart';
import 'package:sakai_mobile/component/app_bar_box.dart';
import 'package:sakai_mobile/function/download_file.dart';
import 'package:sakai_mobile/provider/url.dart';
import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/view/site_top.dart';

class SiteResourceView extends SiteListWithOneSiteDetailsSliderView {
  final SharedPreferences pref;
  SiteResourceView(
      {super.key,
      required this.pref,
      required super.siteId,
      required super.title,
      super.type = 2});

  final provider = StateNotifierProvider<ResourceListProvider, List<Resource>?>(
      (_) => ResourceListProvider(null));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(provider.notifier).init(pref, siteId ?? '').then((_) {
        refresh(ref);
      });
    });

    return Column(
      children: [
        AppBarBox(
          color: Theme.of(context).primaryColor,
          text: title ?? '',
          textColor: Colors.white,
          leftWidget: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => ref
                .read(viewProvider.notifier)
                .update(SiteTopView(pref: pref, siteId: siteId, title: title)),
          ),
        ),
        Expanded(
            child: _SiteResourceView(
          pref: pref,
          provider: provider,
        )),
      ],
    );
  }

  Future refresh(WidgetRef ref) async {
    final domain = ref.read(domainProvider);
    if (domain == null) return;

    ref.watch(provider.notifier).refresh(pref, domain);
  }
}

class _SiteResourceView extends ConsumerWidget {
  final SharedPreferences pref;
  final StateNotifierProvider<ResourceListProvider, List<Resource>?> provider;
  const _SiteResourceView({required this.pref, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resourceList = ref.watch(provider);

    if (resourceList == null || resourceList.isEmpty) {
      return RefreshIndicator(
          onRefresh: () => forcedRefresh(ref),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              color: Colors.white,
              height: double.maxFinite,
            ),
          ));
    }

    final rootNode = TreeNode.root(data: resourceList[0]);
    List<TreeNode<Resource>> nodeList = [rootNode];

    for (int i = 1; i < resourceList.length; i++) {
      final resource = resourceList[i];
      final childContainer = resource.container ?? '';
      final childNode = TreeNode(key: '$i', data: resource);

      for (TreeNode<Resource> node in nodeList) {
        final parentUrl = node.data!.url ?? '';
        if (_isChild(parentUrl, childContainer)) {
          node.add(childNode);
          break;
        }
      }
      nodeList.add(childNode);
    }

    return RefreshIndicator(
      onRefresh: () => forcedRefresh(ref),
      child: TreeView.simpleTyped(
        tree: rootNode,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        showRootNode: true,
        indentation: const Indentation(style: IndentStyle.squareJoint),
        expansionBehavior: ExpansionBehavior.snapToTop,
        expansionIndicatorBuilder: (context, node) {
          return ChevronIndicator.rightDown(
            tree: node,
            alignment: Alignment.centerLeft,
            color: Colors.grey[700],
          );
        },
        builder: (context, node) {
          final title = node.data!.title ?? '';
          final modifiedDate = node.data!.modifiedDate ?? '';
          final mimeType = node.data!.type ?? '';
          final isFolder = (mimeType == TYPE_FOLDER);
          final isNodeExpanded = node.isExpanded;
          final isNew = ref.read(provider.notifier).getLocalState(modifiedDate);

          return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Stack(children: [
                GestureDetector(
                  child: ListTile(
                    title: Text(
                      title,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontVariations: const [FontVariation('wght', 500)]),
                    ),
                    subtitle: Text(
                        '${L10n.of(context)!.modified_date}: $modifiedDate'),
                    leading: _getIcon(mimeType, isNodeExpanded),
                    trailing: IconButton(
                        onPressed: () => download(context, node),
                        icon: const Icon(Icons.download)),
                    onTap: isFolder ? null : () => onTap(context, node),
                  ),
                ),
                if (isNew == true)
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12.5),
                        child: Text(
                          'New',
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontVariations: const [
                                FontVariation('wght', 700)
                              ]),
                        ),
                      ))
              ]));
        },
      ),
    );
  }

  Future forcedRefresh(WidgetRef ref) async {
    final domain = ref.read(domainProvider);
    if (domain == null) return;

    await ref.watch(provider.notifier).forcedRefresh(pref, domain);
  }

  Future onTap(BuildContext context, TreeNode<Resource> node) async {
    final resource = node.data;
    if (resource == null) return;
    final mimeType = resource.type;
    if (mimeType == TYPE_URL) {
      final url = resource.webLinkUrl;
      if (url == null) return;
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      return;
    }
    final url = resource.url;
    if (url == null) return;
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Future download(BuildContext context, TreeNode<Resource> node) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    final urlsList = getUrlOfChildrenOrSelf(node);

    List<XFile> xfileList = [];
    List<File> fileList = [];
    if (urlsList != null) {
      for (final urls in urlsList) {
        final url = urls.$1;
        final mimeType = urls.$2;
        final title = urls.$3;

        final (xfile, file) = await downloadFile(url, mimeType, title);

        xfileList.add(xfile);
        fileList.add(file);

        if (urls != urlsList.last) {
          await Future.delayed(const Duration(seconds: MIN_ACCESS_INTERVAL));
        }
      }
    }

    if (!(context.mounted)) return;
    if (xfileList.isNotEmpty) {
      await Share.shareXFiles(xfileList);
      if (context.mounted) Navigator.pop(context);
      for (final file in fileList) {
        file.delete();
      }
    }
  }

  /// (url,mimeType,title)
  List<(String, String, String)>? getUrlOfChildrenOrSelf(
      TreeNode<Resource> node) {
    final resource = node.data;
    if (resource == null) return null;
    if (resource.type == TYPE_FOLDER) {
      List<(String, String, String)>? result = [];
      for (final child in node.children.values) {
        final listOfChild = getUrlOfChildrenOrSelf(child as TreeNode<Resource>);
        if (listOfChild != null) {
          result.addAll(listOfChild);
        }
      }
      return result;
    }
    final url = resource.url;
    final mimeType = resource.type;
    final title = resource.title;
    if (url == null || mimeType == null || title == null) return null;
    return [(url, mimeType, title)];
  }
}

bool _isChild(String parentUrl, String childContainer) {
  final decodedParentUrl = Uri.decodeFull(parentUrl);
  final regStr = childContainer + r'$';
  return RegExp(regStr).hasMatch(decodedParentUrl);
}

Widget _getIcon(String mimeType, bool isNodeExpanded) {
  if (mimeType == TYPE_URL) {
    return const Icon(Icons.link);
  }

  return switch (mimeType.split('/')[0]) {
    TYPE_FOLDER => Icon(isNodeExpanded ? Icons.folder_open : Icons.folder),
    TYPE_DOCUMENT => const Icon(Icons.description_outlined),
    TYPE_IMAGE => const Icon(Icons.image_outlined),
    TYPE_VIDEO => const Icon(Icons.video_camera_back_outlined),
    TYPE_AUDIO => const Icon(Icons.music_note_outlined),
    _ => Container(width: 0),
  };
}
