import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.margin = const EdgeInsets.all(0),
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.autofocus = false,
      this.suffix,
      })
      : super(key: key);

  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool obscureText;
  final EdgeInsetsGeometry margin;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    ) ;
  }
}
