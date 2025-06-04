import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:all_country_code/all_country_code.dart';
import 'package:gybry_demo/presentation/pages/sign_up/utils/constants.dart';
import 'package:gybry_demo/presentation/pages/sign_up/widgets/dropdown_menu.dart';
import 'package:gybry_demo/presentation/pages/sign_up/widgets/phone_field.dart';
import 'package:gybry_demo/presentation/pages/sign_up/widgets/sign_up_text_field.dart';
import 'package:gybry_demo/presentation/utils/app_images.dart';
import 'package:gybry_demo/presentation/utils/app_text_styles.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSport;
  String? _selectedStatus;
  final TextEditingController _phoneController = TextEditingController();
  Country _selectedCountry = Country(
    name: 'Belarus',
    isoCode: 'BY',
    callingCode: '+375',
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 80),
              Image(image: AssetImage(logo), width: 150),
              const SizedBox(height: 30),
              SignUpTextField(
                label: 'ФИО (на русском языке)',
                validator: _validateName,
              ),
              const SizedBox(height: 16),
              SignUpTextField(
                label: 'ФИ (на латинице)',
                validator: _validateName,
              ),
              const SizedBox(height: 16),
              SignUpDropdownMenu(
                label: 'Вид спорта',
                items: sportsList,
                selectedValue: _selectedSport,
                onChanged: (value) {
                  setState(() {
                    _selectedSport = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              SignUpDropdownMenu(
                label: 'Ваш статус в спорте',
                items: statutesList,
                selectedValue: _selectedStatus,
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              SignUpTextField(label: 'Клуб или без клуба'),
              const SizedBox(height: 16),
              SignUpTextField(label: 'Страна клуба или без клуба'),
              const SizedBox(height: 16),
              SignUpTextField(label: 'Ваш Email', validator: _validateEmail),
              const SizedBox(height: 16),
              PhoneInputField(
                countries: countries,
                selectedCountryCode: 'BY',
                onCountrySelected: (isoCode) {
                  _selectedCountry =
                      countries.where((e) => e.isoCode == isoCode).first;
                },
                phoneController: _phoneController,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Зарегистрироваться'),
                ),
              ),
              SizedBox(height: 8),
              Text(
                license,
                textAlign: TextAlign.center,
                style: descriptionFont,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите ФИО';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, введите Email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Пожалуйста, введите корректный Email';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Регистрация успешна!')));
    }
  }
}
