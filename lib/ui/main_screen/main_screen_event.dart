part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class ChangePage extends MainScreenEvent {
  final int page;

  ChangePage({required this.page});
}
