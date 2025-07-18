import 'package:flutter/widgets.dart';
import 'package:flutter_app_events/enums/app_state_enum.dart';
import 'package:flutter_app_events/event_bus_listener.dart';

/// Observes the app's lifecycle and reports state changes.
///
/// This class listens to Flutter's [WidgetsBindingObserver] callbacks
/// and notifies the provided [onAppEvent] callback whenever the app's
/// lifecycle state changes.
class AppStateObserver with WidgetsBindingObserver {
  /// Callback that is triggered when the app's [AppState] changes.
  final AppEventCallback? onAppEvent;

  /// Creates an [AppStateObserver] and registers it with the [WidgetsBinding].
  AppStateObserver({this.onAppEvent}) {
    WidgetsBinding.instance.addObserver(this);
  }

  /// Disposes the observer and removes it from the [WidgetsBinding].
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (onAppEvent == null) return;

    switch (state) {
      case AppLifecycleState.resumed:
        onAppEvent!(AppState.resumed);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        onAppEvent!(AppState.paused);
        break;
      case AppLifecycleState.detached:
        onAppEvent!(AppState.background);
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }
}
