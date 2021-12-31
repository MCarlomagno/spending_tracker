import 'package:flutter/material.dart';

class BucketAmount extends StatelessWidget {
  final String amount;
  const BucketAmount({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      amount,
      style: TextStyle(fontSize: 18),
    );
  }
}
