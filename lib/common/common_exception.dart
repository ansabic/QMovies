abstract class CommonException implements Exception {
  final String error;

  CommonException({required this.error});
}

class ClientError extends CommonException {
  ClientError({required super.error});
}
