import 'package:flutter/material.dart';
import 'package:test_pt_navios/utils/constant.dart';
import 'package:test_pt_navios/views/login_screen/views/login_screen.dart';
import 'package:test_pt_navios/widgets/custom_form_field_text_widgets.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'registerscreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordHide = true;
  @override
  Widget build(BuildContext context) {
    Constant constant = Constant(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selamat datang di aplikasi kami.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constant.fontExtraBig,
                    color: Color(Constant.witheColorNetral))),
            // Pembatas Jarak
            SizedBox(height: constant.size.height * 0.010),
            Text('Kami sudah menunggu Anda.',
                style: TextStyle(
                    fontSize: Constant.fontBig,
                    color: Color(Constant.witheColorNetral))),
            // Pembatas Jarak
            SizedBox(height: constant.size.height * 0.010),
            Text('Yuk Daftar Sekarang!',
                style: TextStyle(
                    fontSize: Constant.fontSemiBig,
                    color: Color(Constant.witheColorNetral))),
            // Pembatas Jarak
            SizedBox(height: constant.size.height * 0.080),
            // Form Full Name
            // Form Full Name
            CustomTextFormFieldWidgets(
              hintText: 'Nama Lengkap',
            ),
            // Pembatas Jarak
            SizedBox(height: constant.size.height * 0.030),
            // Form Email
            CustomTextFormFieldWidgets(
              hintText: 'Email',
            ),
            // Pembatas Jarak
            SizedBox(height: constant.size.height * 0.030),
            // Form Password
            CustomTextFormFieldWidgets(
              hintText: 'Password',
              isPassword: true,
              isPasswordHide: isPasswordHide,
              onTap: () {
                setState(() {
                  isPasswordHide = !isPasswordHide;
                });
              },
            ),
// Pembatas Jarak
            SizedBox(height: constant.size.height * 0.150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah Punya akun? ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constant.fontRegular,
                        color: Color(Constant.grayColorNetralDark))),
                // Pembatas Jarak
                SizedBox(width: constant.size.width * 0.005),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeName, (route) => false);
                  },
                  child: Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Constant.fontRegular,
                          color: Color(Constant.witheColorNetral))),
                ),
              ],
            ),
            // Pembatas Jarak
            SizedBox(height: constant.size.height * 0.025),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(constant.size.width * 0.800,
                        constant.size.height * 0.070),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    backgroundColor: Color(Constant.witheColorNetral)),
                child: Text('Register',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constant.fontRegular,
                        color: Color(Constant.blackColorBase))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
