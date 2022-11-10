import 'package:flutter/material.dart';
import 'package:q_movies/ui/splash_screen/splash_screen.dart';

import '../../../common/constants.dart';

class QMoviesMaterial extends StatelessWidget {
  const QMoviesMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
