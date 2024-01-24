import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintTextKey;
  final TextEditingController controller;
  const TextFieldWidget({required this.hintTextKey, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
            ),
            hintText: "",
          ) //AppLocale.of(BuildContext, context)
          //.getTranslations(hintTextKey)),
          ),
    );
  }
}
