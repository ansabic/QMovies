import 'package:injectable/injectable.dart';
import 'package:q_movies/repository/remote/remote_genre/remote_genre_repository.dart';

import '../../common/result.dart';
import '../../model/genre/genre.dart';
import '../../repository/local/abstract/local_list_repository.dart';
import 'genres_service.dart';

@Injectable(as: GenresService)
class GenresServiceImpl extends GenresService {
  final RemoteGenreRepository _remoteGenreRepository;
  final LocalListRepository<Genre> _localGenreRepository;

  GenresServiceImpl(this._remoteGenreRepository, this._localGenreRepository);

  @override
  Future<void> syncGenres() async {
    final allLocal = _localGenreRepository.getAllElements();
    final allRemote = await _remoteGenreRepository.getAllGenres();
    if (allRemote is Value) {
      final data = (allRemote.value ?? []);
      final List<Genre> listToAdd = [];
      for (var element in data) {
        if (!allLocal.contains(element)) {
          listToAdd.add(element);
        }
      }
      for (var element in allLocal) {
        if (!data.contains(element)) {
          await _localGenreRepository.removeItem(element: element);
        }
      }
      await _localGenreRepository.insertElements(elements: listToAdd);
    }
  }
}
