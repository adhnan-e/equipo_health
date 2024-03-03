import 'package:equipo_health/presentation/signup/widgets/common_radiobutton.dart';
import 'package:equipo_health/presentation/login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../common/common_button.dart';
import '../common/common_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameController = TextEditingController();
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
            const Text("User",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900,color: Colors.black),),
            const Spacer(flex: 1,),
            const Text("Sign in to continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.grey),),
            const Spacer(flex: 2,),
            CommonTextFieldWidget(hintText: 'Name',controller: _nameController,),
            CommonTextFieldWidget(hintText: 'Email',controller: _emailController,),
            CommonTextFieldWidget(hintText: 'Password',isPassword: true,controller: _passwordController,),
            const GenderWidget(),
            const Spacer(flex: 1,),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Already have an account? ',style: TextStyle(color: Colors.grey,fontSize: 16)),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),)),
                    text: 'Login',
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xff35A1FF)),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2,),
            CommonButtonWidget(callback: () => Provider.of<AuthProvider>(context, listen: false).signup(context,name: _nameController.text, email: _emailController.text, password: _passwordController.text)),
            const Spacer(flex: 4,),
          ],),
      ),
    );
  }
}
