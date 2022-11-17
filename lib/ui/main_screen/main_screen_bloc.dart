import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final PageController pageController = PageController();

  MainScreenBloc() : super(const MainScreenInitial()) {
    on<ChangePageNavigation>((event, emit) {
      pageController.animateToPage(event.page, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });

    on<ChangePageSwipe>((event, emit) {
      emit(RefreshMainScreenState(page: event.page));
    });
  }
}
