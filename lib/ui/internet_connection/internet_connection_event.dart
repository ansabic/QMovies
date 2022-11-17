part of 'internet_connection_bloc.dart';

@immutable
abstract class InternetConnectionEvent {}

class CheckInternetConnection extends InternetConnectionEvent {}

class StopConnectivityCheck extends InternetConnectionEvent {}

class StartConnectivityCheck extends InternetConnectionEvent {}
