import 'package:flutter/material.dart';

// circular progress indicator
// implementation for buttons
class CircularProgressButton extends StatelessWidget {
  const CircularProgressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}
