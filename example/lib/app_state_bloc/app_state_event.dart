part of 'app_state_bloc.dart';

@immutable
sealed class AppStateEvent {}

class AppStartedEvent extends AppStateEvent {}

class AppPausedEvent extends AppStateEvent {}

class AppResumedEvent extends AppStateEvent {}

class AppBackgroundEvent extends AppStateEvent {}

class AppForegroundEvent extends AppStateEvent {}

class AppClosedEvent extends AppStateEvent {}
