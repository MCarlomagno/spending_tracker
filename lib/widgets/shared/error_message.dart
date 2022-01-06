import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String? message;
  const ErrorMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      color: Colors.redAccent,
      child: Text(
        message != null ? message! : '',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
