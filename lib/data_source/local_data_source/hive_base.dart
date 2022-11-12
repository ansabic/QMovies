import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/local_data_source.dart';
import 'package:q_movies/model/loaded_pages/max_pages.dart';

import '../../model/movie/movie.dart';

@Injectable(as: LocalDataSource)
class HiveBase extends LocalDataSource {
  static bool _registeredAdapters = false;

  static Future<void> init() async {
    await Hive.initFlutter("q_movies");
    _registerAdapters();
    await _openBoxesSecurely();
  }

  static Future<void> _openBoxesSecurely() async {
    const securityKey = "security_key_q_movies";
    const secureStorage = FlutterSecureStorage();
    String? key;

    if (await secureStorage.containsKey(key: securityKey)) {
      key = await secureStorage.read(key: securityKey);
    } else {
      key = base64Encode(Hive.generateSecureKey());
      await secureStorage.write(key: securityKey, value: key);
    }
    if (key == null) {
      key = base64Encode(Hive.generateSecureKey());
      await secureStorage.write(key: securityKey, value: key);
    }
    await Hive.openBox("movies", encryptionCipher: HiveAesCipher(base64Decode(key)));
  }

  static void _registerAdapters() {
    if (!_registeredAdapters) {
      _registeredAdapters = true;
      Hive.registerAdapter(MovieAdapter());
      Hive.registerAdapter(MaxPagesAdapter());
    }
  }

  Box<dynamic> maxPages() => Hive.box("max_pages");

  Box<dynamic> movies() => Hive.box("movies");

  Box<dynamic>? getProperBox<T>() {
    switch (T) {
      case Movie:
        return movies();
      case MaxPages:
        return maxPages();
    }
    return null;
  }

  @override
  Future<void> addItem<T>({required T item}) async {
    await getProperBox<T>()?.add(item);
  }

  @override
  Future<void> addItems<T>({required List<T> items}) async {
    await getProperBox<T>()?.addAll(items);
  }

  @override
  Future<void> deleteAll<T>() async {
    final box = getProperBox<T>();
    await box?.deleteAll(box.keys);
  }

  @override
  Future<void> deleteItemInList<T>({required T item}) async {
    final box = getProperBox<T>();
    final existing = getItem<T>(item: item);
    final index = box?.values.toList().indexOf(existing);
    if (index != null && index != -1) {
      await box?.deleteAt(index);
    }
  }

  @override
  List<T> getAll<T>() {
    return getProperBox<T>()?.values.toList().cast<T>() ?? [];
  }

  @override
  bool containsItem<T>({required T item}) {
    return getItem<T>(item: item) != null;
  }

  @override
  T? getItem<T>({required T item}) {
    return getProperBox<T>()?.values.firstWhereOrNull((element) => element == item);
  }

  @override
  Stream<dynamic>? watch<T>() {
    return getProperBox<T>()?.watch();
  }

  @override
  Map<K, List<V>> getDictionary<K, V>() {
    return getProperBox<V>()?.toMap().map((key, value) => MapEntry(key, (value as List<dynamic>).cast<V>())) ?? {};
  }

  @override
  Future<void> putAt<K, V>({required List<V> items, required K key}) async {
    await getProperBox<V>()?.put(key.toString(), items);
  }

  @override
  List<V> getAt<K, V>({required K key}) {
    return (getProperBox<V>()?.get(key) ?? []) as List<V>;
  }

  @override
  Future<void> deleteItemInMap<K, V>({required V item, required K key}) async {
    final box = getProperBox<V>();
    final list = box?.get(key) as List<V>;
    if (list.isNotEmpty) {
      await box?.put(key, list.where((element) => element != item));
    }
  }
}
