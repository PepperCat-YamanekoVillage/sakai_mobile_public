import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final domainProvider = StateNotifierProvider<_DomainProvider, String?>(
    (_) => _DomainProvider(null));

class _DomainProvider extends StateNotifier<String?> {
  _DomainProvider(super.state);

  void init(SharedPreferences pref) async {
    final domain = pref.getString('domain');
    if (domain != null) state = domain;
  }

  void update(String domain) async {
    state = domain;

    final pref = await SharedPreferences.getInstance();
    pref.setString('domain', domain);
  }
}
