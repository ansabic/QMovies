abstract class LocalDataSource {
  List<T> getAll<T>();

  Map<K, List<V>> getDictionary<K, V>();

  Future<void> putAt<K, V>({required List<V> items, required K key});

  List<V> getAt<K, V>({required K key});

  Future<void> addItem<T>({required T item});

  Future<void> addItems<T>({required List<T> items});

  Future<void> deleteItemInList<T>({required T item});

  Future<void> deleteItemInMap<K, V>({required V item, required K key});

  Future<void> deleteAll<T>();

  bool containsItem<T>({required T item});

  T? getItem<T>({required T item});

  Stream<dynamic>? watch<T>();
}
