import 'package:flutter/material.dart';

class AppSelectOption {
  String label;
  String value;

  AppSelectOption({
    required this.label,
    required this.value,
  });
}

class AppSelectField extends StatelessWidget {
  AppSelectField(
      {Key? key,
      required this.labelText,
      required this.items,
      required this.onChanged,
      this.autofocus = false})
      : super(key: key);

  final String? labelText;
  final bool autofocus;
  final List<AppSelectOption> items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: List.generate(
        this.items.length,
        (index) => DropdownMenuItem(
          onTap: () {},
          child: Text(items[index].label),
          value: items[index].value,
        ),
      ),
      onChanged: this.onChanged,
      autofocus: this.autofocus,
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
    );
  }
}
