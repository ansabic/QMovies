import 'package:flutter/widgets.dart';

abstract class MoviesPaginationController {
  int currentPage = 0;

  ScrollController get scrollController;

  int getLoadedPages();

  int getMaxPage();

  void scrollListener();

  void dispose();
}
