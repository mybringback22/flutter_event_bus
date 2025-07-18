import 'dart:async';
import 'package:flutter_app_events/enums/network_state_enum.dart';
import 'package:flutter_app_events/event_bus_listener.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Observes the device's network connectivity state.
///
/// This class listens to changes from [connectivity_plus] and
/// notifies the provided [onNetworkEvent] callback whenever
/// the device connects to or disconnects from the internet.
class ConnectivityStateObserver {
  /// Callback that is triggered when the [NetworkState] changes.
  final ConnectivityEventCallback? onNetworkEvent;

  /// Subscription to the connectivity changes stream.
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  /// Creates a [ConnectivityStateObserver] and starts listening
  /// for connectivity changes.
  ConnectivityStateObserver({this.onNetworkEvent}) {
    _startListening();
  }

  /// Starts listening to connectivity changes.
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

  /// Disposes the observer and cancels the connectivity subscription.
  void dispose() {
    _subscription?.cancel();
  }
}
