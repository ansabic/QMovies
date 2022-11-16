import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_movies/common/custom_colors.dart';
import 'package:q_movies/common/mobile_platform.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final Color backgroundColor = CustomColors.background;
  final double bottomNavIconSize = 15;

  const BaseScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobilePlatform.switchPlatform<Widget>(
        android: Scaffold(
          body: child,
          backgroundColor: backgroundColor,
        ),
        iOS: CupertinoPageScaffold(
          backgroundColor: backgroundColor,
          child: child,
        ))!;
  }
}
