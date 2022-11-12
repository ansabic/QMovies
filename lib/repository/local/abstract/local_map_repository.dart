

abstract class LocalMapRepository<K, V> {
  Future<void> putAt({required K key, required V element});

  Future<void> insertElementsAt({required K key, required List<V> elements});

  List<V> getAllElementsAt({required K key});

  Map<K, V> getAll();

  Future<void> removeAll();

  Stream<dynamic>? watch();
}
