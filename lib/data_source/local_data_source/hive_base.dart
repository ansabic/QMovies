import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:q_movies/common/hive_type_id.dart';
import 'package:q_movies/model/favorites/favorites.dart';
import 'package:q_movies/model/genre/genre.dart';
import 'package:q_movies/model/loaded_pages/max_pages.dart';

import '../../model/movie/movie.dart';

class HiveBase {
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
    await Hive.openBox("max_pages", encryptionCipher: HiveAesCipher(base64Decode(key)));
    await Hive.openBox("genres", encryptionCipher: HiveAesCipher(base64Decode(key)));
  }

  static void _registerAdapters() {
    if (!_registeredAdapters) {
      _registeredAdapters = true;
      Hive.registerAdapter(MovieAdapter());
      Hive.registerAdapter(MaxPagesAdapter());
      Hive.registerAdapter(GenreAdapter());
    }
  }

  Box<dynamic> maxPages() => Hive.box("max_pages");

  Box<dynamic> movies() => Hive.box("movies");

  Box<dynamic> genres() => Hive.box("genres");

  int key<T>() {
    switch (T) {
      case Movie:
        return HiveTypeId.movieTypeId;
      case MaxPages:
        return HiveTypeId.maxPagesTypeId;
      case Genre:
        return HiveTypeId.genreTypeId;
      case Favorites:
        return HiveTypeId.favoritesTypeId;
    }
    return -1;
  }

  Box<dynamic>? getProperBox<T>() {
    switch (T) {
      case Movie:
        return movies();
      case MaxPages:
        return maxPages();
      case Genre:
        return genres();
    }
    return null;
  }
}
