part of 'internet_connection_bloc.dart';

@immutable
abstract class InternetConnectionState {
  final bool hasAccessToInternet;

  const InternetConnectionState({required this.hasAccessToInternet});
}

class InternetConnectionInitial extends InternetConnectionState {
  const InternetConnectionInitial() : super(hasAccessToInternet: true);
}

class RefreshedInternetState extends InternetConnectionState {
  const RefreshedInternetState({required super.hasAccessToInternet});
}
