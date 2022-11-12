import 'package:flutter/material.dart';
import 'package:q_movies/repository/remote/remote_movie/remote_movie_repository.dart';
import 'package:q_movies/ui/splash_screen/splash_screen.dart';

import '../../../common/constants.dart';
import '../../../di/di.dart';

class QMoviesMaterial extends StatelessWidget {
  const QMoviesMaterial({super.key});

  Future<void> test() async {
    final test = await getIt<RemoteMovieRepository>().getMoviesPage(page: 1);
    debugPrint(test.toString());
  }

  @override
  Widget build(BuildContext context) {
    test();
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
