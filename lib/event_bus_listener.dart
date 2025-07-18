import 'package:app_events/app_events.dart';
import 'package:flutter/widgets.dart';

typedef AppEventCallback = void Function(AppState state);
typedef ConnectivityEventCallback = void Function(NetworkState state);
class EventBusListener extends StatefulWidget {
  final Widget child;
  final AppEventCallback? onAppEvent;
  final ConnectivityEventCallback? onConnectivityEvent;

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
    _networkStateObserver = ConnectivityStateObserver(onNetworkEvent: widget.onConnectivityEvent);
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