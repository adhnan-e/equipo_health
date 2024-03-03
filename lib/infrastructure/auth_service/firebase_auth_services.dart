import 'package:firebase_auth/firebase_auth.dart';

import '../../presentation/common/common_toast.dart';

class FirebaseAuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email,
      String password) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast(message: 'The account already exists for that email.');
      } else {
        showToast(message: 'Some error occurred: ${e.message}');
      }
    } catch (e) {
      showToast(message: 'Unexpected Error: ${e.toString()}');
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email,
      String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showToast(message: 'Wrong password provided for that user.');
      } else {
        showToast(message: 'Some error occurred: ${e.message}');
      }
    } catch (e) {
      showToast(message: 'Unexpected Error: ${e.toString()}');
    }
  }

  User? currentUser(){
    return  _auth.currentUser;

  }

  Future<void> logout() async {
    try {
     await _auth.signOut();

    } catch (e) {
      showToast(message: 'Unexpected Error: ${e.toString()}');
    }
  }
}