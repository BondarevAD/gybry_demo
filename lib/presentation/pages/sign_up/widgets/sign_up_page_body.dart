import 'package:flutter/material.dart';
import 'package:all_country_code/all_country_code.dart';
import 'package:gybry_demo/presentation/pages/profile_set_up/profile_set_up_page.dart';
import 'package:gybry_demo/presentation/widgets/phone_field.dart';
import 'package:gybry_demo/presentation/widgets/sign_up_text_field.dart';

import 'package:gybry_demo/presentation/utils/app_images.dart';
// Импорт профиля

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _passwordError;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Country _selectedCountry = countries.firstWhere((c) => c.isoCode == 'BY');

  @override
  void initState() {
    super.initState();
    _confirmPasswordController.addListener(_checkPasswordsMatch);
  }

  void _checkPasswordsMatch() {
    setState(() {
      if (_confirmPasswordController.text != _passwordController.text) {
        _passwordError = 'Пароли не совпадают';
      } else {
        _passwordError = null;
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Image(image: AssetImage(logo), width: 150),
                const SizedBox(height: 30),

                PhoneInputField(
                  countries: countries,
                  selectedCountryCode: 'BY',
                  onCountrySelected: (isoCode) {
                    setState(() {
                      _selectedCountry = countries.firstWhere(
                        (c) => c.isoCode == isoCode,
                      );
                    });
                  },
                  phoneController: _phoneController,
                ),

                const SizedBox(height: 16),

                SigningTextField(
                  label: 'Email',
                  controller: _emailController,
                  validator: _validateEmail,
                ),

                const SizedBox(height: 16),

                SigningTextField(
                  label: 'Пароль',
                  isPassword: _obscurePassword,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Введите пароль';
                    if (value.length < 6) return 'Минимум 6 символов';
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 16),

                SigningTextField(
                  label: 'Подтвердите пароль',
                  isPassword: _obscureConfirmPassword,
                  controller: _confirmPasswordController,
                  validator: (value) => _passwordError,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
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
                    child: const Text('Далее'),
                  ),
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Уже есть аккаунт? Войти'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Введите Email';
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Некорректный Email';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfileSetUpPage()),
      );
    }
  }
}
