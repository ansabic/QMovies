abstract class LocalListDataSource<T> {
  List<T> getAll();

  Future<void> addItem({required T item});

  Future<void> addItems({required List<T> items});

  Future<void> deleteItemInList({required T item});

  Future<void> deleteAll();

  bool containsItem({required T item});

  T? getItem({required T item});

  Stream<dynamic>? watch();
}
