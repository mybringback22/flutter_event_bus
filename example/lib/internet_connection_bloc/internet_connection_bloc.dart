import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  InternetConnectionBloc() : super(InternetConnectedState()) {
    
    on<InternetDisconnectedEvent>((event, emit) {
      emit(InternetDisconnectedState());
    });

    on<InternetConnectedEvent>((event, emit) {
      emit(InternetConnectedState());
    });
    
  }
}
