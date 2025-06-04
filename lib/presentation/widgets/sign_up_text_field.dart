import 'package:flutter/material.dart';

class SigningTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final Color labelColor;
  final FontWeight textWeight;
  final double borderRadius;
  final bool? isPassword;
  final IconButton? suffixIcon;
  final TextEditingController? controller;

  const SigningTextField({
    super.key,
    required this.label,
    this.validator,
    this.labelColor = Colors.grey,
    this.textWeight = FontWeight.bold,
    this.borderRadius = 10.0,
    this.isPassword,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        labelStyle: TextStyle(color: labelColor),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      style: TextStyle(fontWeight: textWeight),
      obscureText: isPassword ?? false,
    );
  }
}
