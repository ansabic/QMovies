abstract class MoviesPaginationController {
  int currentPage = 0;

  int getLoadedPages();

  int getMaxPage();

  void scrollListener();

  void dispose();
}
