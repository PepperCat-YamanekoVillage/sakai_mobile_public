import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sakai_mobile/class/view/slider_view.dart';

class SiteListWithOneSiteDetailsSliderView extends SliderView {
  final String? siteId;
  final String? title;

  /// 0->top / 1->announcement / 2->resource / 3->assignment / 4->quiz
  final int type;
  const SiteListWithOneSiteDetailsSliderView(
      {super.key,
      required this.siteId,
      required this.title,
      required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
