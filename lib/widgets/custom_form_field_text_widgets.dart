import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/constant.dart';

class CustomTextFormFieldWidgets extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool isPasswordHide;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const CustomTextFormFieldWidgets({
    required this.hintText,
    this.isPassword = false,
    this.isPasswordHide = true,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && isPasswordHide,
      decoration: InputDecoration(
        //Fungsi Sembunyikan atau Menampilkan Password
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
      ),
      style: TextStyle(color: Color(Constant.witheColorNetral)),
    );
  }
}
