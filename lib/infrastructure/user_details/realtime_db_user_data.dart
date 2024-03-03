import 'package:firebase_database/firebase_database.dart';

import '../../domain/user_model.dart';

class RealtimeDBUserData{
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();


  updateDataToDB({required UserModel user,}){
    _databaseReference.child("Users").child(user.id).update(user.toMap());
  }
  Future<UserModel> getUserData(String id) async {
    UserModel user =UserModel("", "", "", "");
    try {
 await _databaseReference.child("Users").child(id).once().then((value) {
   final Map<dynamic, dynamic> data =
   value.snapshot.value! as Map<dynamic, dynamic>;
   print('Error fetching user data: ${data["id"].toString()}');

    user=UserModel(data["id"].toString(), data["name"].toString(), data["email"].toString(), data["gender"].toString());

      });

    } catch (e) {

      print('Error fetching user data: $e');
    }
    return user;
  }
}