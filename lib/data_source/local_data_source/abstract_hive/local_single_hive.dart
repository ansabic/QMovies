import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/abstract/local_single_data_source.dart';
import 'package:q_movies/data_source/local_data_source/hive_base.dart';

@injectable
class LocalSingleHive<T> extends HiveBase implements LocalSingleDataSource<T> {
  @override
  T? getSingle() {
    return getProperBox<T>()?.get(key<T>()) as T?;
  }

  @override
  Future<void> removeData() async {
    await getProperBox<T>()?.delete(key<T>());
  }

  @override
  Future<void> setSingle({required T data}) async {
    await removeData();
    await getProperBox<T>()?.put(key<T>(), data);
  }
}
