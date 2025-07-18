import 'package:flutter/widgets.dart';
import 'package:flutter_app_events/enums/app_state_enum.dart';
import 'package:flutter_app_events/enums/network_state_enum.dart';
import 'package:flutter_app_events/observers/app_state_observer.dart';
import 'package:flutter_app_events/observers/connectivity_state_observer.dart';

/// Signature for a callback triggered when the app's [AppState] changes.
typedef AppEventCallback = void Function(AppState state);

/// Signature for a callback triggered when the [NetworkState] changes.
typedef ConnectivityEventCallback = void Function(NetworkState state);

/// A widget that listens for app lifecycle and network connectivity events.
///
/// Wrap your widget tree with [EventBusListener] to automatically observe
/// the app's foreground/background state and network connectivity changes.
/// Provide [onAppEvent] and/or [onConnectivityEvent] callbacks to respond
/// to these changes.
class EventBusListener extends StatefulWidget {
  /// The widget subtree that this [EventBusListener] wraps.
  final Widget child;

  /// Callback that is triggered when the app's [AppState] changes.
  final AppEventCallback? onAppEvent;

  /// Callback that is triggered when the device's [NetworkState] changes.
  final ConnectivityEventCallback? onConnectivityEvent;

  /// Creates an [EventBusListener].
  ///
  /// Both [onAppEvent] and [onConnectivityEvent] are optional.
  /// At least [child] must be provided.
  const EventBusListener({
    super.key,
    required this.child,
    this.onAppEvent,
    this.onConnectivityEvent,
  });

  @override
  State<EventBusListener> createState() => _EventBusListenerState();
}

class _EventBusListenerState extends State<EventBusListener> {
  AppStateObserver? _appStateObserver;
  ConnectivityStateObserver? _networkStateObserver;

  @override
  void initState() {
    super.initState();
    _appStateObserver = AppStateObserver(onAppEvent: widget.onAppEvent);
    _networkStateObserver = ConnectivityStateObserver(
      onNetworkEvent: widget.onConnectivityEvent,
    );
  }

  @override
  void dispose() {
    _appStateObserver?.dispose();
    _networkStateObserver?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
