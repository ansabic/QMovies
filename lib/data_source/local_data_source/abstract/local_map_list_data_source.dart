abstract class LocalMapListDataSource<K, V> {
  Map<K, List<V>> getDictionary();

  Future<void> putAt({required List<V> items, required K key});

  List<V> getAt({required K key});

  Future<void> deleteItemInMap({required V item, required K key});

  Future<void> deleteAll();
}
