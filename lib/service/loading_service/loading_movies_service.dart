import 'package:injectable/injectable.dart';

@singleton
class LoadingMoviesService {
  bool _loading = false;

  bool get isLoading => _loading;

  void setLoading({required bool loading}) => _loading = loading;
}
