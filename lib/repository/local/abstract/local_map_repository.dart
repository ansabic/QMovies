abstract class LocalMapRepository<K, V> {
  Future<void> putAt({required K key, required List<V> element});

  List<V> getAllElementsAt({required K key});

  Map<K, List<V>> getAll();

  Future<void> removeAll();

  Stream<dynamic>? watch();
}
