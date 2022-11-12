import 'package:flutter/material.dart';
import 'package:q_movies/ui/splash_screen/splash_screen.dart';

import '../../../common/app_config.dart';
import '../../../common/constants.dart';
import '../../../common/route_names.dart';

class QMoviesMaterial extends StatelessWidget {
  const QMoviesMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return AppConfig.routes[RouteNames.mainScreen]!(context);
          },
          transitionDuration: const Duration(milliseconds: 1200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
      theme: ThemeData(
        fontFamily: "SFPro",
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
