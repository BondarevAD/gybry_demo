import 'package:flutter/material.dart';
import 'package:all_country_code/all_country_code.dart';
import 'package:gybry_demo/presentation/pages/profile/profile_page.dart';
import 'package:gybry_demo/presentation/pages/profile_set_up/utils/constants.dart';
import 'package:gybry_demo/presentation/widgets/dropdown_menu.dart';
import 'package:gybry_demo/presentation/widgets/sign_up_text_field.dart';
import 'package:gybry_demo/presentation/utils/app_images.dart';
import 'package:gybry_demo/presentation/utils/app_text_styles.dart';

class ProfileSetUpPageBody extends StatefulWidget {
  const ProfileSetUpPageBody({super.key});

  @override
  State<ProfileSetUpPageBody> createState() => _ProfileSetUpPageBodyState();
}

class _ProfileSetUpPageBodyState extends State<ProfileSetUpPageBody> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSport;
  String? _selectedStatus;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _customSportController = TextEditingController();
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(height: 20),
            Image(image: AssetImage(logo), width: 150),
            const SizedBox(height: 30),
            SigningTextField(
              label: 'ФИО (на русском языке)',
              validator: _validateName,
            ),
            const SizedBox(height: 16),
            SigningTextField(
              label: 'ФИ (на латинице)',
              validator: _validateName,
            ),
            const SizedBox(height: 16),
            AppDropdownMenu(
              label: 'Вид спорта',
              items: sportsList,
              selectedValue: _selectedSport,
              onChanged: (value) {
                setState(() {
                  _selectedSport = value;
                });
              },
            ),
            if (_selectedSport == 'Свой вариант')
              Column(
                children: [
                  const SizedBox(height: 16),
                  SigningTextField(
                    label: 'Введите ваш вид спорта',
                    validator: (value) {
                      if (_selectedSport == 'Свой вариант' &&
                          (value == null || value.isEmpty)) {
                        return 'Пожалуйста, введите ваш вид спорта';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            const SizedBox(height: 16),
            AppDropdownMenu(
              label: 'Ваш статус в спорте',
              items: statutesList,
              selectedValue: _selectedStatus,
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value;
                });
              },
            ),
            if (_selectedStatus == 'Другое')
              Column(
                children: [
                  const SizedBox(height: 16),
                  SigningTextField(
                    label: 'Введите ваш статус',
                    validator: (value) {
                      if (_selectedStatus == 'Другое' &&
                          (value == null || value.isEmpty)) {
                        return 'Пожалуйста, введите ваш статус';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            const SizedBox(height: 16),
            SigningTextField(label: 'Клуб или без клуба'),
            const SizedBox(height: 16),
            SigningTextField(label: 'Страна клуба или без клуба'),
            const SizedBox(height: 16),

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
            Text(license, textAlign: TextAlign.center, style: descriptionFont),
          ],
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Регистрация успешна!')));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }
}
