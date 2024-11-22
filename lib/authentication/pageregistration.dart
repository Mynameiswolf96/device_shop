import 'package:device_shop/authentication/authentication.dart';
import 'package:device_shop/textfields/textfields.dart';
import 'package:flutter/material.dart';

class PageRegistration extends StatelessWidget {
  const PageRegistration({super.key});

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
        suffixIcon: null, obscureText: false,
      ),
      textFieldsPassword: TextFields(
        textEditingController: TextEditingController.fromValue(
          const TextEditingValue(text: 'password'),
        ),
        authenticationName: 'Password',
        icon: Icons.password,
        suffixIcon: Icons.remove_red_eye, obscureText: true,
      ),
      bottomTextButton: 'Зарегистрироваться',
      questionText: 'Есть аккаунт? Войдите',
    );
  }
}
