

import 'package:flutter/widgets.dart';
import 'package:flutter_app_events/enums/app_state_enum.dart';
import 'package:flutter_app_events/event_bus_listener.dart';

// typedef AppEventCallback = void Function(AppState state);

class AppStateObserver with WidgetsBindingObserver {
  final AppEventCallback? onAppEvent;

  AppStateObserver({this.onAppEvent}) {
    WidgetsBinding.instance.addObserver(this);
  }

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