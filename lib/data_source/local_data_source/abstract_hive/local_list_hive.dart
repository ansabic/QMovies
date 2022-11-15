import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/hive_base.dart';

import '../abstract/local_list_data_source.dart';

@injectable
class LocalListHive<T> extends HiveBase implements LocalListDataSource<T> {
  @override
  Future<void> addItem({required T item}) async {
    await getProperBox<T>()?.add(item);
  }

  @override
  Future<void> addItems({required List<T> items}) async {
    await getProperBox<T>()?.addAll(items);
  }

  @override
  Future<void> deleteAll() async {
    final box = getProperBox<T>();
    await box?.deleteAll(box.keys);
  }

  @override
  Future<void> deleteItemInList({required T item}) async {
    final box = getProperBox<T>();
    final existing = getItem(item: item);
    final index = box?.values.toList().indexOf(existing);
    if (index != null && index != -1) {
      await box?.deleteAt(index);
    }
  }

  @override
  List<T> getAll() {
    return getProperBox<T>()?.values.toList().cast<T>() ?? [];
  }

  @override
  bool containsItem({required T item}) {
    return getItem(item: item) != null;
  }

  @override
  T? getItem({required T item}) {
    return getProperBox<T>()?.values.firstWhereOrNull((element) => element == item);
  }

  @override
  Stream<dynamic>? watch() {
    return getProperBox<T>()?.watch();
  }
}
