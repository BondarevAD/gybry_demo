import 'package:flutter/material.dart';
import 'package:all_country_code/all_country_code.dart';
import 'package:gybry_demo/presentation/pages/profile/profile_page.dart';
import 'package:gybry_demo/presentation/widgets/phone_field.dart';
import 'package:gybry_demo/presentation/widgets/sign_up_text_field.dart';
import 'package:gybry_demo/presentation/pages/sign_up/sign_up_page.dart';
import 'package:gybry_demo/presentation/utils/app_colors.dart';
import 'package:gybry_demo/presentation/utils/app_images.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _useEmail = true;
  bool _obscurePassword = true;

  Country _selectedCountry = Country(
    name: 'Belarus',
    isoCode: 'BY',
    callingCode: '+375',
  );

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 80),
            Image(image: AssetImage(logo), width: 150),
            const SizedBox(height: 30),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child:
                  _useEmail
                      ? SigningTextField(
                        key: const ValueKey('email'),
                        label: 'Email',
                        validator: _validateEmail,
                      )
                      : PhoneInputField(
                        key: const ValueKey('phone'),
                        countries: countries,
                        selectedCountryCode: 'BY',
                        onCountrySelected: (isoCode) {
                          _selectedCountry = countries.firstWhere(
                            (e) => e.isoCode == isoCode,
                          );
                        },
                        phoneController: _phoneController,
                      ),
            ),

            const SizedBox(height: 16),

            SigningTextField(
              label: 'Пароль',
              validator: _validatePassword,
              isPassword: _obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Implement forgot password logic
                },
                child: const Text('Забыли пароль?'),
              ),
            ),

            const SizedBox(height: 8),

            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Войти через:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChoiceChip(
                        label: Text(
                          'Email',
                          style: TextStyle(
                            color:
                                _useEmail
                                    ? Colors.white
                                    : Colors.black, // цвет зависит от выбора
                          ),
                        ),
                        selected: _useEmail,
                        onSelected: (_) {
                          setState(() {
                            _useEmail = true;
                          });
                        },
                        checkmarkColor: white,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      const SizedBox(width: 6),
                      ChoiceChip(
                        label: Text(
                          'Телефон',
                          style: TextStyle(
                            color:
                                !_useEmail
                                    ? Colors.white
                                    : Colors.black, // цвет зависит от выбора
                          ),
                        ),
                        selected: !_useEmail,
                        onSelected: (_) {
                          setState(() {
                            _useEmail = false;
                          });
                        },
                        checkmarkColor: white,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ],
                  ),
                ],
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
                child: const Text('Войти'),
              ),
            ),

            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: const Text('Нет аккаунта? Зарегистрироваться'),
            ),
          ],
        ),
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

  String? _validatePassword(String? value) {
    if (value == null || value.length < 6) return 'Минимум 6 символов';
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Вход выполнен!')));
      // TODO: Navigate to main app screen

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }
}
