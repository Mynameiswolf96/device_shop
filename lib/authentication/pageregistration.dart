import 'package:device_shop/authentication/authentication.dart';
import 'package:device_shop/textfields/textfields.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class PageRegistration extends StatefulWidget {
  const PageRegistration({super.key});

  @override
  State<PageRegistration> createState() => _PageRegistrationState();
}

class _PageRegistrationState extends State<PageRegistration> {
  bool _obscureText = true; // 👈 Изменяемая переменная

  @override
  Widget build(BuildContext context) {
    return AuthenticationWidget(
      namePage: 'Регистрация',
      nameBottom: null,
      textFieldsEmail: TextFields(
        textEditingController: TextEditingController.fromValue(
          const TextEditingValue(text: 'user'),
        ),
        authenticationName: 'Email',
        icon: Icons.email,
        suffixIcon: null,
        obscureText: false,
        onSuffixIconPressed: null,
      ),
      textFieldsPassword: TextFields(
        textEditingController: TextEditingController.fromValue(
          const TextEditingValue(text: 'password'),
        ),
        authenticationName: 'Password',
        icon: Icons.password,
        suffixIcon: _obscureText ? Icons.visibility_off : Icons.visibility,
        // 👈 Меняется
        obscureText: _obscureText,
        // 👈 Передаём состояние
        onSuffixIconPressed: () {
          setState(() {
            _obscureText = !_obscureText; // 👈 Правильное переключение
          });
        },
      ),
      bottomTextButton: 'Зарегистрироваться',
      questionText: 'Есть аккаунт? Войдите',
      onQuestionTextTap: () {
        context.go('/'); // 👈 Переход на страницу авторизации
      },
    );
  }
}
