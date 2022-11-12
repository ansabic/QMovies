import 'package:flutter/cupertino.dart';
import 'package:q_movies/common/constants.dart';
import 'package:q_movies/ui/splash_screen/splash_screen.dart';

import '../../../common/app_config.dart';

class QMoviesCupertino extends StatelessWidget {
  const QMoviesCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      routes: AppConfig.routes,
      title: Constants.appName,
      home: const SplashScreen(),
    );
  }
}
