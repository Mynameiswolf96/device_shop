import 'package:device_shop/app.dart';
import 'package:device_shop/textfields/textfields.dart';
import 'package:device_shop/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({
    required this.namePage,
    required this.nameBottom,
    required this.textFieldsEmail,
    required this.textFieldsPassword,
    required this.bottomTextButton,
    required this.questionText,
    super.key,
  });

  final String questionText;
  final String namePage;
  final String? nameBottom;
  final String bottomTextButton;
  final TextFields textFieldsEmail;
  final TextFields textFieldsPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  textAlign: TextAlign.start,
                  namePage,
                  style: const TextStyle(
                    fontSize: 50,
                    color: AppColor.purple,
                  ),
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              SizedBox(
                child: textFieldsEmail,
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: textFieldsPassword,
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  nameBottom ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 40, right: 40),
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (textFieldsEmail.textEditingController.text == 'user' &&
                        textFieldsPassword.textEditingController.text ==
                            'password') {
                      context.go('/main');
                    } else {
                      showSnackBar(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    bottomTextButton,
                    style: const TextStyle(fontSize: 20, color: AppColor.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: Text(
                  questionText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: const Text('Неправильный логин или пароль'),
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: 'Закрыть',
      onPressed: () {
        // Код для выполнения какого-либо действия при нажатии на кнопку
      },
    ),
  );

  // Отображение SnackBar
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
