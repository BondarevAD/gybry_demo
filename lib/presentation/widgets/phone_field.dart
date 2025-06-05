import 'package:all_country_code/all_country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gybry_demo/presentation/utils/extensions.dart';

class PhoneInputField extends StatelessWidget {
  final List<Country> countries;
  final String selectedCountryCode;
  final ValueChanged<String> onCountrySelected;
  final TextEditingController phoneController;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final double borderRadius;
  final Color labelColor;

  const PhoneInputField({
    super.key,
    required this.countries,
    required this.selectedCountryCode,
    required this.onCountrySelected,
    required this.phoneController,
    this.hintText = '(99) 9999999',
    this.labelText = 'Ваш телефон',
    this.validator,
    this.borderRadius = 10.0,
    this.labelColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 170,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomCountryDropdown(
              filteredCountries: countries,
              selectedCountry: selectedCountryCode,
              onSelected: onCountrySelected,
              showCountryName: false,
              hintText: 'Выбор страны',
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              labelStyle: context.theme.textTheme.bodyMedium!.copyWith(
                fontSize: 16,
              ),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: validator ?? _defaultValidator,
          ),
        ),
      ],
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите телефон';
    }
    if (value.length < 7) {
      return 'Телефон слишком короткий';
    }
    return null;
  }
}
