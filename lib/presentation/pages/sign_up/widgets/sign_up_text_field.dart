import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final Color labelColor;
  final FontWeight textWeight;
  final double borderRadius;

  const SignUpTextField({
    super.key,
    required this.label,
    this.validator,
    this.labelColor = Colors.grey,
    this.textWeight = FontWeight.bold,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        labelStyle: TextStyle(color: labelColor),
      ),
      validator: validator,
      style: TextStyle(fontWeight: textWeight),
    );
  }
}
