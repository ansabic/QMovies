import 'dart:convert';

import 'package:injectable/injectable.dart';

@injectable
class FormatToBasicAuth {
  String execute({required String username, required String password}) =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';
}
