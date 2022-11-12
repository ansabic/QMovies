import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Movies",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
