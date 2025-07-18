import 'dart:developer';

import 'package:app_events/app_events.dart';
import 'package:example/app_state_bloc/app_state_bloc.dart';
import 'package:example/internet_connection_bloc/internet_connection_bloc.dart';
import 'package:example/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppStateBloc()),
          BlocProvider(create: (context) => InternetConnectionBloc()),
        ],
        child: AppWidget(),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EventBusListener(
      onAppEvent: (state) {
        log("--------> State: $state");
        switch (state) {
          case AppState.background:
            context.read<AppStateBloc>().add(AppBackgroundEvent());
            break;
          case AppState.paused:
            context.read<AppStateBloc>().add(AppPausedEvent());
            break;
          case AppState.resumed:
            context.read<AppStateBloc>().add(AppResumedEvent());
            break;
          case AppState.foreground:
            context.read<AppStateBloc>().add(AppForegroundEvent());
            break;
        }
      },
      onNetworkEvent: (state) {
        log("--------> Network State: $state");
        switch (state) {
          case NetworkState.disconnected:
            context.read<InternetConnectionBloc>().add(InternetDisconnectedEvent());
            break;
          case NetworkState.connected:
            context.read<InternetConnectionBloc>().add(InternetConnectedEvent());
            break;
        }
      },
      child: DashBoard(),
    );
  }
}
