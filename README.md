# app_events

**app_events** is a simple Flutter package to detect **app lifecycle events** (like foreground, background, paused) and **network connectivity changes**, then propagate these events through your app with your own state management (e.g. BLoC, Provider).

---

## 🚀 Features

- ✅ Listen for app lifecycle state changes:
  - `foreground`, `background`, `resumed`, `paused`
- ✅ Listen for network connectivity changes:
  - `connected`, `disconnected`
- ✅ Simple, widget-first approach with `EventBusListener`

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  app_events:



  ## 🧩 Usage

### 1️⃣ Wrap your app with `EventBusListener`

**Important:**  
✅ Use **only one** `EventBusListener` in your widget tree.  
✅ Propagate its events using **BLoC**, **Provider**, **Riverpod**, or any other state management solution.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_events/app_events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Events Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppStateBloc()),
          BlocProvider(create: (_) => InternetConnectionBloc()),
        ],
        child: const AppWidget(),
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
        print("App state changed: $state");
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
      onConnectivityEvent: (state) {
        print("Network state changed: $state");
        switch (state) {
          case NetworkState.connected:
            context.read<InternetConnectionBloc>().add(InternetConnectedEvent());
            break;
          case NetworkState.disconnected:
            context.read<InternetConnectionBloc>().add(InternetDisconnectedEvent());
            break;
        }
      },
      child: const Dashboard(),
    );
  }
}



## ⚡ Best Practice

✅ **Use only one `EventBusListener` widget per app.**

✅ **Propagate state changes** via **BLoC**, **Provider**, **Riverpod**, or your preferred state management to avoid duplicate listeners and ensure predictable state flow.




## ✨ Author

**Umar Manzoor** –  [@mybringback22](https://github.com/mybringback22)

---

### 🔑 Copy & adjust

- Replace **Your Name**, **your.website**, and **@yourhandle** with your actual info.
- Add a real `Dashboard` widget or explain it if needed.
- You can include more sections like **Installation**, **Features**, or **Changelog** if you want!

If you’d like, I can generate those too — just say **“yes”** 🚀
