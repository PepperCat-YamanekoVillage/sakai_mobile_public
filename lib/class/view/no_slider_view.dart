import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sakai_mobile/class/view/slider_view.dart';

class NoSliderView extends SliderView {
  const NoSliderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
