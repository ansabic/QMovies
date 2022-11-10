import 'package:flutter/cupertino.dart';
import 'package:q_movies/common/mobile_platform.dart';
import 'package:q_movies/ui/app/q_movies_material/q_movies_material.dart';

void main() {
  runApp(MobilePlatform.switchPlatform<Widget>(android: const QMoviesMaterial(), iOS: const CupertinoApp())!);
}
