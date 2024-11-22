import 'package:device_shop/authentication/authentication.dart';
import 'package:device_shop/textfields/textfields.dart';
import 'package:flutter/material.dart';

class PageAuthorization extends StatelessWidget {
  const PageAuthorization({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationWidget(
      namePage: 'Вход в аккаунт',
      nameBottom: 'Забыли пароль?',
      textFieldsEmail: TextFields(
        authenticationName: 'Email',
        icon: Icons.email,
        suffixIcon: null,
        textEditingController: TextEditingController.fromValue(
          const TextEditingValue(text: 'user'),
        ),
        obscureText: false,
      ),
      textFieldsPassword: TextFields(
        textEditingController: TextEditingController.fromValue(
          const TextEditingValue(text: 'password'),
        ),
        authenticationName: 'Password',
        icon: Icons.password,
        suffixIcon: Icons.remove_red_eye,
        obscureText: true,
      ),
      bottomTextButton: 'Войти',
      questionText: 'Нет аккаунта? Зарегистрируйтесь',
    );
  }
}
