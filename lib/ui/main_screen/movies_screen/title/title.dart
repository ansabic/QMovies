import 'package:flutter/widgets.dart';

import '../../../../common/custom_colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double textTopPadding = 30;
  final double horizontalPadding = 20;
  final double bottomPadding = 20;

  const CustomTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: textTopPadding, left: horizontalPadding, bottom: bottomPadding),
          child: Text(
            title,
            style: const TextStyle(fontSize: 22, color: CustomColors.almostWhite, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
