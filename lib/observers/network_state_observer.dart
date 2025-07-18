import 'dart:async';
import 'package:app_events/enums/network_state_enum.dart';
import 'package:app_events/event_bus_listener.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStateObserver {
  final NetworkEventCallback? onNetworkEvent;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  NetworkStateObserver({this.onNetworkEvent}) {
    _startListening();
  }

  void _startListening() {
    final connectivity = Connectivity();
    _subscription = connectivity.onConnectivityChanged.listen((result) {
      if (onNetworkEvent == null) return;

      if (result.isEmpty || result[0] == ConnectivityResult.none) {
        onNetworkEvent!(NetworkState.disconnected);
      } else {
        onNetworkEvent!(NetworkState.connected);
      }
    });
  }

  void dispose() {
    _subscription?.cancel();
  }
}
