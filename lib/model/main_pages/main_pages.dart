import 'package:collection/collection.dart';

enum MainPages {
  movies(page: 0),
  favorites(page: 1);

  final int page;

  static MainPages? getMainPageFromPage({required int page}) {
    return MainPages.values.firstWhereOrNull((element) => element.page == page);
  }

  const MainPages({required this.page});
}
