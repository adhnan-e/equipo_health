import 'package:equipo_health/domain/user_model.dart';
import 'package:equipo_health/presentation/dashboard/dashboard_screen.dart';
import 'package:equipo_health/presentation/login/login_screen.dart';
import 'package:equipo_health/presentation/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:equipo_health/infrastructure/auth_service/firebase_auth_services.dart';
import 'package:equipo_health/presentation/common/common_toast.dart';

import '../infrastructure/user_details/realtime_db_user_data.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final RealtimeDBUserData _dbUserData = RealtimeDBUserData();
  int _selectedGender = 0;
  late UserModel userModel;

  int get selectedGender => _selectedGender;

  void updateGender(int newValue) {
    _selectedGender = newValue;
    notifyListeners();
  }

onInit(BuildContext context){
    Future.delayed(const Duration(milliseconds: 100),() async{
     User? user= _auth.currentUser();
     userModel=(await _dbUserData.getUserData(user?.uid??""));

     if (user != null) {
        Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => DashboardScreen()),
       );
     } else {
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => LoginScreen()));
     }
    },);
}

  void login(BuildContext context,
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      showToast(message: 'Please fill in all fields');
      return;
    }
    bool isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!isValidEmail) {
      showToast(message: 'Please enter a valid email address');
      return;
    }
    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      userModel=(await _dbUserData.getUserData(user.uid));
      showToast(message: 'User is successfully signed in');
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      showToast(message: 'Login failed. Please check your credentials');
    }
  }

  void signup(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      showToast(message: 'Please fill in all fields');
      return;
    }

    bool isValidEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!isValidEmail) {
      showToast(message: 'Please enter a valid email address');
      return;
    }

    if (password.length < 8) {
      showToast(message: 'Password must be at least 8 characters');
      return;
    }

    User? userCredential =
        await _auth.signUpWithEmailAndPassword(email, password);

    if (userCredential != null) {
      userModel=UserModel(userCredential.uid, name, email, getGender());
      _dbUserData.updateDataToDB(user: userModel);
      showToast(message: 'User is successfully signed up');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    }


  }

  logout(BuildContext context)async{
   await _auth.logout();
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen(),));
  }


 String getGender(){
    switch(_selectedGender){
      case 0:
        return "Male";
      case 1:
        return "Female";
      case 2:
        return "Others";
      default:
        return "Others";
    }
  }
}
