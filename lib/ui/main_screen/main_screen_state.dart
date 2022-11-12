part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {
  final int page;

  const MainScreenState({required this.page});
}

class MainScreenInitial extends MainScreenState {
  const MainScreenInitial() : super(page: 0);
}

class RefreshMainScreenState extends MainScreenState {
  const RefreshMainScreenState({required super.page});
}
