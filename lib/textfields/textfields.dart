import 'package:device_shop/app.dart';
import 'package:flutter/material.dart';


class TextFields extends StatefulWidget {
  const TextFields({
    required this.authenticationName,
    required this.icon,
    required this.suffixIcon,
    required this.textEditingController,
    required this.obscureText,
    super.key,
  });

  final IconData? suffixIcon;
  final String authenticationName;
  final IconData icon;
  final TextEditingController textEditingController;
  final bool obscureText;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50),
      height: 48,
      child: TextField(
        controller: widget.textEditingController,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), // Радиус скругления
            borderSide:
                const BorderSide(color: Colors.blue), // Цвет по умолчанию
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ), // Цвет для неактивного состояния
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Colors.green), // Цвет при фокусе
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red), // Цвет при ошибке
          ),
          hintText: widget.authenticationName,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.grey.withOpacity(0.5),
          ),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.grey,
          ),
          suffixIcon: Icon(widget.suffixIcon),
          filled: true,
          fillColor: Colors.grey[100], // Цвет фона
        ),
      ),
    );
  }
}
