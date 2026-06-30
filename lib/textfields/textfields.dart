import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({
    required this.authenticationName,
    required this.icon,
    required this.textEditingController,
    required this.obscureText,
    this.suffixIcon,
    this.onSuffixIconPressed,
    super.key,
  });

  final IconData? suffixIcon;
  final String authenticationName;
  final IconData icon;
  final TextEditingController textEditingController;
  final bool obscureText;
  final VoidCallback? onSuffixIconPressed;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50),
      height: 48,
      child: TextField(
        controller: widget.textEditingController,
        obscureText: _obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
          hintText: widget.authenticationName,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.grey,
          ),
          suffixIcon: widget.suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                    if (widget.onSuffixIconPressed != null) {
                      widget.onSuffixIconPressed!();
                    } else {
                      // Если колбэк не передан, переключаем состояние внутри
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    }
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }
}
