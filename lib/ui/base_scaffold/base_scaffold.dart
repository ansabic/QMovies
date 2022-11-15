import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_movies/common/custom_colors.dart';
import 'package:q_movies/common/mobile_platform.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final Color backgroundColor = CustomColors.background;

  const BaseScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobilePlatform.switchPlatform<Widget>(
        android: Scaffold(
          body: child,
          backgroundColor: backgroundColor,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites")
            ],
          ),
        ),
        iOS: CupertinoPageScaffold(
          backgroundColor: backgroundColor,
          child: child,
        ))!;
  }
}
