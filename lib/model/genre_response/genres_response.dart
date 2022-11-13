import '../genre/genre.dart';

class GenresResponse {
  GenresResponse({
    List<Genre>? genres,
  }) {
    _genres = genres;
  }

  GenresResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genre.fromJson(v));
      });
    }
  }

  List<Genre>? _genres;

  GenresResponse copyWith({
    List<Genre>? genres,
  }) =>
      GenresResponse(
        genres: genres ?? _genres,
      );

  List<Genre>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
