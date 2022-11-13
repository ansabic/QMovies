abstract class LocalListRepository<T> {
  bool hasElement({required T element});

  Future<void> insertElement({required T element});

  Future<void> insertElements({required List<T> elements});

  List<T> getAllElements();

  Future<void> removeItem({required T element});

  Future<void> removeAll();

  Stream<dynamic>? watch();
}
