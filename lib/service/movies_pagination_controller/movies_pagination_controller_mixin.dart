import 'package:flutter/widgets.dart';

abstract class IMoviesPaginationControllerMixin {
  ScrollController get scrollController;

  int getLoadedPages();

  int getMaxPage();

  void scrollListener();

  void dispose();
}
