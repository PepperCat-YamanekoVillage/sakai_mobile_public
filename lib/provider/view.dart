import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sakai_mobile/class/view/slider_view.dart';

final viewProvider = StateNotifierProvider<_ViewProvider, SliderView?>(
    (_) => _ViewProvider(null));

class _ViewProvider extends StateNotifier<SliderView?> {
  _ViewProvider(super.state);

  void update(SliderView view) async {
    state = view;
  }
}
