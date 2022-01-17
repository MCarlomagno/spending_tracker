import 'package:flutter/material.dart';

class AddBucketButton extends StatelessWidget {
  final void Function()? onPressed;
  const AddBucketButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double size = 150.0;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(right: 10),
      height: size,
      width: size,
      child: IconButton(
        icon: Icon(Icons.add_circle_outline_outlined),
        onPressed: onPressed,
        iconSize: 30,
      ),
    );
  }
}