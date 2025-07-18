part of 'internet_connection_bloc.dart';

@immutable
sealed class InternetConnectionEvent {}


class InternetConnectedEvent extends InternetConnectionEvent {}

class InternetDisconnectedEvent extends InternetConnectionEvent {}
