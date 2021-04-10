import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key key,
      @required this.labelText,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  final String labelText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      cursorColor: Color(0xFF5BC8AA),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText,
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
    );
  }
}
