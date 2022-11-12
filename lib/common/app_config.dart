import 'package:flutter/widgets.dart';
import 'package:q_movies/common/route_names.dart';
import 'package:q_movies/ui/main_screen/main_screen.dart';
import 'package:q_movies/ui/splash_screen/splash_screen.dart';

class AppConfig {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.mainScreen: (_) => const MainScreen(),
    RouteNames.splashScreen: (_) => const SplashScreen()
  };
}
