/// A Flutter package for observing app lifecycle and network connectivity state.
///
/// This library exports all core components:
/// - [AppState] and [NetworkState] enums.
/// - [AppStateObserver] and [ConnectivityStateObserver] classes.
/// - [EventBusListener] widget for easy integration.
library;

export 'package:flutter_app_events/enums/app_state_enum.dart';
export 'package:flutter_app_events/enums/network_state_enum.dart';
export 'package:flutter_app_events/observers/app_state_observer.dart';
export 'package:flutter_app_events/observers/connectivity_state_observer.dart';
export 'package:flutter_app_events/event_bus_listener.dart';