import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final FormFieldValidator<String> validator;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  const MyTextField(
      {super.key,
      required this.textInputType,
      required this.hintText,
      required this.prefixIcon,
      required this.controller,
      required this.validator,
      this.maxLength,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        validator: validator,
        keyboardType: textInputType,
        controller: controller,
        maxLength: maxLength,
        inputFormatters: const [],
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            suffixIcon: InkWell(
                onTap: () {
                  controller.clear();
                },
                child: const Icon(Icons.cancel)),
            prefixIcon: prefixIcon,
            fillColor: Colors.grey[300],
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}
