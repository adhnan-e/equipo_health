import 'package:equipo_health/presentation/common/common_button.dart';
import 'package:equipo_health/presentation/common/common_text_field.dart';
import 'package:equipo_health/presentation/signup/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 4,),
            const Text("Welcome",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,color: Colors.black),),
            const Text("Back",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,color: Colors.black),),

            const Text("Sign in to continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.grey),),
            const Spacer(flex: 2,),
            CommonTextFieldWidget(hintText: 'Email',controller: _emailController,),
            CommonTextFieldWidget(hintText: 'Password',isPassword: true,controller: _passwordController,),
            const Spacer(flex: 1,),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Crete new account? ',style: TextStyle(color: Colors.grey,fontSize: 16)),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen(),)),
                    text: 'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xff35A1FF)),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1,),
            CommonButtonWidget(callback: () => Provider.of<AuthProvider>(context, listen: false).login(context, email: _emailController.text, password: _passwordController.text)),
            const Spacer(flex: 4,),
          ],),
      ),
    );
  }
}
