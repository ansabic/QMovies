import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final PageController pageController = PageController();

  MainScreenBloc() : super(const MainScreenInitial()) {
    on<ChangePage>((event, emit) {
      emit(RefreshMainScreenState(page: event.page));
    });
  }
}
