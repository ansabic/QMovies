import 'package:q_movies/data_source/local_data_source/abstract/local_map_list_data_source.dart';
import 'package:q_movies/data_source/local_data_source/hive_base.dart';

class LocalMapListHive<K, V> extends HiveBase implements LocalMapListDataSource<K, V> {
  @override
  Map<K, List<V>> getDictionary() {
    return getProperBox<V>()?.toMap().map((key, value) => MapEntry(key, (value as List<dynamic>).cast<V>())) ?? {};
  }

  @override
  Future<void> putAt({required List<V> items, required K key}) async {
    await getProperBox<V>()?.put(key, items);
  }

  @override
  List<V> getAt({required K key}) {
    return (getProperBox<V>()?.get(key) ?? []) as List<V>;
  }

  @override
  Future<void> deleteItemInMap({required V item, required K key}) async {
    final box = getProperBox<V>();
    final list = box?.get(key) as List<V>;
    if (list.isNotEmpty) {
      await box?.put(key, list.where((element) => element != item));
    }
  }

  @override
  Future<void> deleteAll() async {
    final box = getProperBox<V>();
    await box?.deleteAll(box.keys);
  }
}
