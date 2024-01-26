import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData iconData;
  final IconData? iconDataOne;
  final String text;
  final TextEditingController controller;
  const TextFieldWidget({super.key, required this.iconData,  this.iconDataOne, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(iconData),
          suffixIcon: Icon(iconDataOne),
        labelText: text
      ),
    );
  }
}
