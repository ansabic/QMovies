import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/impl/max_pages_data_source.dart';
import 'package:q_movies/model/loaded_pages/max_pages.dart';

import '../abstract/local_single_repository.dart';

@injectable
class LocalMaxPagesRepository implements LocalSingleRepository<MaxPages> {
  MaxPagesDataSource maxPagesDataSource;

  LocalMaxPagesRepository(this.maxPagesDataSource);

  @override
  MaxPages? getSingle() {
    return maxPagesDataSource.getSingle();
  }

  @override
  Future<void> removeData() async {
    await maxPagesDataSource.removeData();
  }

  @override
  Future<void> setSingle({required MaxPages data}) async {
    await maxPagesDataSource.setSingle(data: data);
  }
}
