import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_pt_navios/utils/constant.dart';
import 'package:test_pt_navios/views/home_screen/views/home_screen.dart';
import 'package:test_pt_navios/views/register_screen/views/register_screen.dart';
import 'package:test_pt_navios/widgets/custom_form_field_text_widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginscreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final FireBaseAuthServices _auth = FireBaseAuthServices();
  String email = "", password = "";
  String userEmail = "";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isPasswordHide = true;

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    if (_passwordController.text != '' && _emailController.text != '') {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);

        // Store the user's email
        userEmail = userCredential.user!.email ?? '';

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(Constant.witheColorNetral),
          content: Text('Login Berhasil',
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
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(Constant.witheColorNetral),
            content: Text('User tidak ditemukan',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constant.fontSemiSmall,
                    color: Color(Constant.grayColorNetralDark))),
          ));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(Constant.witheColorNetral),
            content: Text('Password anda salah',
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
              Text('Akan ada hal menarik untuk Anda.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Constant.fontExtraBig,
                      color: Color(Constant.witheColorNetral))),
              // Pembatas Jarak
              SizedBox(height: constant.size.height * 0.010),
              Text('Selamat datang kembali.',
                  style: TextStyle(
                      fontSize: Constant.fontBig,
                      color: Color(Constant.witheColorNetral))),
              // Pembatas Jarak
              SizedBox(height: constant.size.height * 0.010),
              Text('Yuk Login Sekarang!',
                  style: TextStyle(
                      fontSize: Constant.fontSemiBig,
                      color: Color(Constant.witheColorNetral))),
              // Pembatas Jarak
              SizedBox(height: constant.size.height * 0.080),

              // Form Email
              CustomTextFormFieldWidgets(
                hintText: 'Email',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong!';
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
              SizedBox(height: constant.size.height * 0.250),
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
                          context, RegisterScreen.routeName, (route) => false);
                    },
                    child: Text('Register',
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
                      userLogin();
                    }, // onPressed is required, but we handle the logic in onTap
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Color(Constant.witheColorNetral),
                    ),
                    child: Text(
                      'Login',
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
