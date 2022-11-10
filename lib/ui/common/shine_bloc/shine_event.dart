part of 'shine_bloc.dart';

@immutable
abstract class ShineEvent {}

class RefreshShine extends ShineEvent {
  final double value;

  RefreshShine({required this.value});
}

class StartShine extends ShineEvent {}

class StopShine extends ShineEvent {}
