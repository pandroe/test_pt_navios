import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_pt_navios/utils/constant.dart';
import 'package:test_pt_navios/views/home_screen/views/home_screen.dart';
import 'package:test_pt_navios/views/login_screen/views/login_screen.dart';
import 'package:test_pt_navios/widgets/custom_form_field_text_widgets.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'registerscreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final FireBaseAuthServices _auth = FireBaseAuthServices();
  String email = "", password = "", username = '';
  String userEmail = "";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isPasswordHide = true;

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (_passwordController.text != '' &&
        _usernameController.text != '' &&
        _emailController.text != '') {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);

        // Store the user's email
        userEmail = userCredential.user!.email ?? '';

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(Constant.witheColorNetral),
          content: Text('Registrasi Berhasil',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Constant.fontSemiSmall,
                  color: Color(Constant.blackColorBase))),
        ));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(userEmail: userEmail),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(Constant.witheColorNetral),
            content: Text('Password Terlalu Lemah',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constant.fontSemiSmall,
                    color: Color(Constant.grayColorNetralDark))),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(Constant.witheColorNetral),
            content: Text('Email sudah terdaftar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constant.fontSemiSmall,
                    color: Color(Constant.grayColorNetralDark))),
          ));
        }
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Constant constant = Constant(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formkey,
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
              CustomTextFormFieldWidgets(
                hintText: 'Nama Lengkap',
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              // Pembatas Jarak
              SizedBox(height: constant.size.height * 0.030),
              // Form Email
              CustomTextFormFieldWidgets(
                hintText: 'Email',
                controller: _emailController,
                validator: (value) {
                  const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
                      "\\@"
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                      "("
                      "\\."
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
                      ")+";
                  final RegExp regExp = RegExp(expression);

                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong!';
                  } else if (!regExp.hasMatch(value)) {
                    return "Silakan, masukkan email yang valid!";
                  }

                  return null;
                },
              ),

              // Pembatas Jarak
              SizedBox(height: constant.size.height * 0.030),
              // Form Password
              CustomTextFormFieldWidgets(
                hintText: 'Password',
                controller: _passwordController,
                isPassword: true,
                isPasswordHide: isPasswordHide,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong!';
                  } else if (value.length < 8) {
                    return 'Password harus terdiri dari minimal 8 karakter!';
                  } else if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'Password harus mengandung minimal 1 huruf besar!';
                  } else if (!value
                      .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                    return 'Password harus mengandung minimal 1 huruf spesial!';
                  }
                  return null;
                },
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
                child: Container(
                  width: constant.size.width * 0.800,
                  height: constant.size.height * 0.070,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = _emailController.text;
                          password = _passwordController.text;
                        });
                      }
                      registration();
                    }, // onPressed is required, but we handle the logic in onTap
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Color(Constant.witheColorNetral),
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constant.fontRegular,
                        color: Color(Constant.blackColorBase),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
