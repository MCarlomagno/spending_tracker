import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.margin = const EdgeInsets.all(0),
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.suffix,
    this.width,
    this.maxWidth,
  }) : super(key: key);

  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool obscureText;
  final EdgeInsetsGeometry margin;
  final Widget? suffix;
  final double? width;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
      ),
      width: width,
      margin: margin,
      height: 60,
      child: TextField(
        controller: this.controller,
        autofocus: this.autofocus,
        cursorColor: Color(0xFF5BC8AA),
        obscureText: this.obscureText,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: labelText,
          suffix: suffix,
          hintText: labelText,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          focusedBorder: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
