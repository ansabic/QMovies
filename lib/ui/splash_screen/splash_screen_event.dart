part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent {}

class StartLoading extends SplashScreenEvent {}

class Proceed extends SplashScreenEvent {}
