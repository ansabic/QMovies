import 'package:flutter/widgets.dart';
import 'package:q_movies/common/assets.dart';
import 'package:q_movies/ui/base_scaffold/base_scaffold.dart';

class SplashScreen extends StatelessWidget {
  final double iconSize = 80;

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: Center(
      child: Image.asset(
        Assets.qIcon,
        width: iconSize,
        height: iconSize,
      ),
    ));
  }
}
