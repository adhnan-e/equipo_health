class UserModel{
final  String id;
final  String name;
final  String email;
final  String gender;

UserModel(this.id, this.name, this.email, this.gender);

Map<String, dynamic> toMap() {
  return {
    'id': id,
    'name': name,
    'email': email,
    'gender': gender,
  };
}
factory UserModel.fromMap(Map<String, dynamic> map) {
  return UserModel(
    map['id'] as String,
    map['name'] as String,
    map['email'] as String,
    map['gender'] as String,
  );
}
}