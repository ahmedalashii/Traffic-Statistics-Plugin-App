import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;

  const PrimaryTextField(
      {Key? key,
      this.hintText,
      required this.controller,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.onTap,
      this.readOnly = false,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      style: const TextStyle(color: Colors.black),
      keyboardType: keyboardType,
      onTap: onTap ?? () {},
      onFieldSubmitted: onFieldSubmitted ?? (v) {},
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        enabledBorder:  UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder:  UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      validator: validator,
    );
  }
}
