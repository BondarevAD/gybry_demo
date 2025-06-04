import 'package:flutter/material.dart';

class SignUpDropdownMenu extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final Color labelColor;

  const SignUpDropdownMenu({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.labelColor = const Color(0xFFB0B0B0), // lightGrey по умолчанию
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelStyle: TextStyle(color: labelColor),
      ),
      value: selectedValue,
      items:
          items
              .map(
                (String value) =>
                    DropdownMenuItem<String>(value: value, child: Text(value)),
              )
              .toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Пожалуйста, выберите $label';
        }
        return null;
      },
    );
  }
}
