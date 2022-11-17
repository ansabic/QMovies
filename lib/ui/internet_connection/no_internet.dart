import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_colors.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.black),
      child: const Center(
          child: Text(
        "No internet connection",
        style: TextStyle(color: CustomColors.almostWhite),
      )),
    );
  }
}
