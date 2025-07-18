part of 'app_state_bloc.dart';

@immutable
sealed class AppStateState {}

final class AppStarted extends AppStateState {}
final class AppResumed extends AppStateState {}
final class AppPaused extends AppStateState {}
final class AppClosed extends AppStateState {}
final class AppForeground extends AppStateState {}
final class AppBackground extends AppStateState {}
