import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkConnectivityNotifier extends StateNotifier<bool?> {
  NetworkConnectivityNotifier() : super(null) {
    _init();
  }

  void _init() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      state = result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi);
    });
  }

  Future<void> checkNetwork() async {
    state = null;
    final result = await Connectivity().checkConnectivity();
    state = result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi);
  }
}

final networkConnectivityProvider =
    StateNotifierProvider<NetworkConnectivityNotifier, bool?>(
  (ref) => NetworkConnectivityNotifier(),
);
