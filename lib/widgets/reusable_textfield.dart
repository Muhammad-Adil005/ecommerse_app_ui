import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool filled;
  final double borderRadius;
  final Color borderColor;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.fillColor,
    this.filled = true,
    this.borderRadius = 10.0,
    this.borderColor = const Color(0xff636363),
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? const TextStyle(color: Color(0xff636363)),
        fillColor: fillColor ?? Colors.grey[900],
        filled: filled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        prefixIcon: prefixIcon,
      ),
      style: textStyle ?? const TextStyle(color: Color(0xff636363)),
    );
  }
}
