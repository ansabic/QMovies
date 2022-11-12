import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/local_data_source.dart';

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
    }
  }

  @override
  Future<void> addItem<T>({required T item}) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<void> addItems<T>({required List<T> items}) {
    // TODO: implement addItems
    throw UnimplementedError();
  }

  @override
  bool containsItem<T>({required T item}) {
    // TODO: implement containsItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll<T>() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItemInList<T>({required T item}) {
    // TODO: implement deleteItemInList
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItemInMap<K, V>({required V item, required K key}) {
    // TODO: implement deleteItemInMap
    throw UnimplementedError();
  }

  @override
  List<T> getAll<T>() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  List<V> getAt<K, V>({required K key}) {
    // TODO: implement getAt
    throw UnimplementedError();
  }

  @override
  Map<K, List<V>> getDictionary<K, V>() {
    // TODO: implement getDictionary
    throw UnimplementedError();
  }

  @override
  T? getItem<T>({required T item}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<void> putAt<K, V>({required List<V> items, required K key}) {
    // TODO: implement putAt
    throw UnimplementedError();
  }

  @override
  Stream? watch<T>() {
    // TODO: implement watch
    throw UnimplementedError();
  }
}
