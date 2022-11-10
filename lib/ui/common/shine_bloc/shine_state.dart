part of 'shine_bloc.dart';

@immutable
abstract class ShineState {
  final double value;

  const ShineState({required this.value});
}

class ShineInitial extends ShineState {
  const ShineInitial() : super(value: 0);
}

class RefreshShineState extends ShineState {
  const RefreshShineState({required super.value});
}
