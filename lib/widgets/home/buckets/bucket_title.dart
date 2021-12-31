import 'package:flutter/material.dart';

class BucketTitle extends StatelessWidget {
  final String title;
  const BucketTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}