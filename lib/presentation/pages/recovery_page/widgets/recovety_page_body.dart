import 'package:flutter/material.dart';
import 'package:gybry_demo/presentation/utils/app_colors.dart';
import 'package:gybry_demo/presentation/utils/extensions.dart';
import 'package:gybry_demo/presentation/widgets/sign_up_text_field.dart';

class RecoveryPageBody extends StatefulWidget {
  const RecoveryPageBody({super.key});

  @override
  State<RecoveryPageBody> createState() => _RecoveryPageBodyState();
}

class _RecoveryPageBodyState extends State<RecoveryPageBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  bool _submitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _submitted = true;
      });

      // TODO: ADD RECOVERY LOGIC
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
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
          Text(
            "Восстановление пароля",
            style: context.theme.textTheme.bodyLarge,
          ),
          Expanded(
            child: Center(
              child:
                  _submitted
                      ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.mark_email_read,
                            size: 80,
                            color: darkPurple,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Инструкция по восстановлению отправлена на Email.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      )
                      : Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Введите Email, чтобы сбросить пароль',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            SigningTextField(
                              label: 'Email',
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Введите Email';
                                }
                                final emailRegex = RegExp(
                                  r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                                );
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Некорректный Email';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _submit,
                                child: const Text('Отправить'),
                              ),
                            ),
                          ],
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
