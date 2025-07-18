import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStarted()) {
    
    on<AppStartedEvent>((event, emit) => emit(AppStarted()));
    on<AppResumedEvent>((event, emit) => emit(AppResumed()));
    on<AppPausedEvent>((event, emit) => emit(AppPaused()));
    on<AppBackgroundEvent>((event, emit) => emit(AppBackground()));
    on<AppForegroundEvent>((event, emit) => emit(AppForeground()));
    on<AppClosedEvent>((event, emit) => emit(AppClosed()));
  }
}
