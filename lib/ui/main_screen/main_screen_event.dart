part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class ChangePageSwipe extends MainScreenEvent {
  final int page;

  ChangePageSwipe({required this.page});
}

class ChangePageNavigation extends MainScreenEvent {
  final int page;

  ChangePageNavigation({required this.page});
}
