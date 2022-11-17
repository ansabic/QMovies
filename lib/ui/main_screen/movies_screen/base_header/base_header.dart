import 'package:flutter/material.dart';
import 'package:q_movies/common/assets.dart';

class BaseHeader extends StatelessWidget {
  const BaseHeader({Key? key}) : super(key: key);

  final double iconSize = 28;
  final double topPadding = 28;
  final double horizontalPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: horizontalPadding, right: horizontalPadding),
      child: Row(
        children: [
          Image.asset(
            Assets.qIcon,
            height: iconSize,
            width: iconSize,
          ),
        ],
      ),
    );
  }
}
