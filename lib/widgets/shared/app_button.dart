import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final EdgeInsetsGeometry margin;
  final double? maxWidth;

  const AppButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.margin = const EdgeInsets.all(0),
    this.maxWidth = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
      ),
      margin: margin,
      child: MaterialButton(
        height: 50,
        minWidth: MediaQuery.of(context).size.width - 60,
        color: Color(0xFF5BC8AA),
        disabledColor: Colors.grey[400],
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
