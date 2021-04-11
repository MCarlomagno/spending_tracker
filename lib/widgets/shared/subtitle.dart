import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  Subtitle({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
