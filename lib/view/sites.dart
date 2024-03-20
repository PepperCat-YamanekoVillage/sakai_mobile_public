import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sakai_mobile/class/api/site.dart';
import 'package:sakai_mobile/class/provider/api/site_list.dart';
import 'package:sakai_mobile/class/view/site_list_slider_view.dart';
import 'package:sakai_mobile/component/app_bar_box.dart';
import 'package:sakai_mobile/component/animated_heart_icon.dart';
import 'package:sakai_mobile/provider/url.dart';
import 'package:sakai_mobile/provider/visible_site_list.dart';
import 'package:sakai_mobile/provider/view.dart';
import 'package:sakai_mobile/view/site_top.dart';

class SitesView extends SiteListSliderView {
  final SharedPreferences pref;
  SitesView({super.key, required this.pref});

  final provider = StateNotifierProvider<SiteListProvider, List<Site>?>(
      (_) => SiteListProvider(null));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(provider.notifier).init(pref, ref, 'sites').then((_) {
        if (ref.read(provider) != null && ref.read(provider)!.isEmpty) {
          refresh(ref);
        }
      });
    });

    return Column(
      children: [
        AppBarBox(
          color: Theme.of(context).primaryColor,
          text: L10n.of(context)!.site,
          textColor: Colors.white,
          rightWidget: const _VisibleModeIcon(),
        ),
        Expanded(
            child: _SitesView(
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

class _SitesView extends ConsumerWidget {
  final SharedPreferences pref;
  final StateNotifierProvider<SiteListProvider, List<Site>?> provider;
  const _SitesView({required this.pref, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisibleMode = ref.watch(_isVisibleModeProvider);
    final siteList = isVisibleMode
        ? ref.watch(visibleSiteListProvider)
        : ref.watch(provider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 初回起動時にsite一覧をロードする
      if (ref.read(provider) == null &&
          ref.read(provider.notifier).getIsInited()) {
        forcedRefresh(ref);
      }

      // visibleなsiteListが空の時に isVisibleMode = false にする
      if (isVisibleMode &&
          ref.read(provider.notifier).getIsInited() &&
          (ref.watch(visibleSiteListProvider) == null ||
              ref.watch(visibleSiteListProvider)!.isEmpty)) {
        ref.read(_isVisibleModeProvider.notifier).update(false);
      }
    });

    if (siteList == null || siteList.isEmpty) {
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

    int reorderStartIndex = 0;

    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () => forcedRefresh(ref),
        child: ReorderableListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final title = siteList[index].title;
              final siteId = siteList[index].id;
              return Column(
                key: Key('$index'),
                children: [
                  MyListTile(
                      isVisibleMode: isVisibleMode,
                      provider: provider,
                      siteId: siteId,
                      pref: pref,
                      title: title),
                  Divider(
                    color: Theme.of(context).primaryColorDark,
                    height: 1,
                    thickness: 0.55,
                  )
                ],
              );
            },
            itemCount: siteList.length,
            physics: const AlwaysScrollableScrollPhysics(),
            onReorder: (_, __) {},
            onReorderStart: (int index) => reorderStartIndex = index,
            onReorderEnd: (int reorderEndIndex) {
              if (reorderStartIndex == reorderEndIndex) return;
              final isDragDown = reorderStartIndex < reorderEndIndex;

              // dragDown時 onReorderEndのindexが1大きくなる 多分バグ
              ref.read(provider.notifier).reorder(
                    pref,
                    ref,
                    ref.read(_isVisibleModeProvider),
                    isDragDown,
                    siteList[reorderStartIndex].id ?? '',
                    siteList[isDragDown ? reorderEndIndex - 1 : reorderEndIndex]
                            .id ??
                        '',
                  );
            }),
      ),
    );
  }

  Future forcedRefresh(WidgetRef ref) async {
    final domain = ref.read(domainProvider);
    if (domain == null) return;

    await ref.watch(provider.notifier).forcedRefresh(pref, domain);
  }
}

class MyListTile extends ConsumerWidget {
  final bool isVisibleMode;
  final StateNotifierProvider<SiteListProvider, List<Site>?> provider;
  final String? siteId;
  final SharedPreferences pref;
  final String? title;

  const MyListTile({
    super.key,
    required this.isVisibleMode,
    required this.provider,
    required this.siteId,
    required this.pref,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: isVisibleMode ? 15 : 0, right: 15),
      leading: isVisibleMode
          ? null
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: AnimatedHeartIcon(
                initState:
                    ref.read(provider.notifier).getLocalState(siteId ?? '') ??
                        false,
                onFavorite: () => ref
                    .read(provider.notifier)
                    .updateLocalState(pref, ref, siteId ?? '', true),
                onUnfavorite: () => ref
                    .read(provider.notifier)
                    .updateLocalState(pref, ref, siteId ?? '', false),
              ),
            ),
      title: Text(
        title ?? '',
        style: const TextStyle(fontVariations: [FontVariation('wght', 500)]),
      ),
      onTap: () => ref
          .read(viewProvider.notifier)
          .update(SiteTopView(pref: pref, siteId: siteId, title: title)),
    );
  }
}

class _VisibleModeIcon extends ConsumerWidget {
  const _VisibleModeIcon();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisibleMode = ref.read(_isVisibleModeProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: AnimatedHeartIcon(
        initState: isVisibleMode,
        onFavorite: () =>
            ref.read(_isVisibleModeProvider.notifier).update(true),
        onUnfavorite: () =>
            ref.read(_isVisibleModeProvider.notifier).update(false),
        color: Colors.white,
        borderColor: Colors.lightBlue,
      ),
    );
  }
}

final _isVisibleModeProvider =
    StateNotifierProvider<_IsVisibleModeProvider, bool>(
        (_) => _IsVisibleModeProvider(true));

class _IsVisibleModeProvider extends StateNotifier<bool> {
  _IsVisibleModeProvider(super.state);

  void update(bool isVisible) {
    state = isVisible;
  }
}
