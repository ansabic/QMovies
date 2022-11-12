import 'package:injectable/injectable.dart';

import '../model/languages/language.dart';

@injectable
class BuildPopularPaginatedQuery {
  Map<String, dynamic> execute({required Language language, required int page}) =>
      {"language": language.code, "page": page};
}
