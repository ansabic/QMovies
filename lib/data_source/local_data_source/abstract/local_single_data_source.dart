abstract class LocalSingleDataSource<T> {
  T? getSingle();

  Future<void> setSingle({required T data});

  Future<void> removeData();
}
