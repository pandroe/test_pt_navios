import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/constant.dart';

class CustomTextFormFieldWidgets extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool isPasswordHide;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormFieldWidgets({
    required this.hintText,
    this.isPassword = false,
    this.isPasswordHide = true,
    this.onTap,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      suffixIcon: isPassword
          ? GestureDetector(
              child: Icon(
                isPasswordHide ? LineIcons.eyeSlash : LineIcons.eye,
                color: Color(Constant.grayColorNetralDark),
              ),
              onTap: onTap,
            )
          : null,
      hintText: hintText,
      hintStyle: TextStyle(color: Color(Constant.grayColorNetralDark)),
      fillColor: Color(Constant.blackColorTextFormField),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Color(Constant.blackColorborderSide)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Color(Constant.blackColorborderSide)),
      ),
    );

    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword && isPasswordHide,
      decoration: inputDecoration,
      style: const TextStyle(color: Color(Constant.witheColorNetral)),
    );
  }
}
