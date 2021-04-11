import 'package:flutter/material.dart';

class ButtonProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
      width: 20.0,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2.0,
      ),
    );
  }
}
