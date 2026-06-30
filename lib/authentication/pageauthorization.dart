import 'package:device_shop/authentication/authentication.dart';
import 'package:device_shop/textfields/textfields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageAuthorization extends StatefulWidget {
  const PageAuthorization({super.key});

  @override
  State<PageAuthorization> createState() => _PageAuthorizationState();
}

class _PageAuthorizationState extends State<PageAuthorization> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AuthenticationWidget(
      namePage: 'Вход в аккаунт',
      nameBottom: 'Забыли пароль?',
      textFieldsEmail: TextFields(
        authenticationName: 'Email',
        icon: Icons.email,
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
        obscureText: _obscureText,
        suffixIcon: _obscureText ? Icons.visibility_off : Icons.visibility,
        onSuffixIconPressed: () {
          // 👈 Передаём сюда
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      bottomTextButton: 'Войти',
      questionText: 'Нет аккаунта? Зарегистрируйтесь',
      onQuestionTextTap: () {
        context.go('/page_registration'); // 👈 Переход на регистрацию
      },
    );
  }
}
