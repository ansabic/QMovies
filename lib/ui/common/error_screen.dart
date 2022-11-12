import 'package:flutter/widgets.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({Key? key, this.message = "Something went wrong"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
