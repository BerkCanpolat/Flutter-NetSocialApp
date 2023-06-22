import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? email;
  final String? name;
  final String? password;
  final String? uid;
  final String? userName;


  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.uid,
    required this.userName,
  });

  Map<String,dynamic> toJson() => {
    "email":email,
    "name":name,
    "password":password,
    "uid":uid,
    "userName":userName
  };

  static UserModel fromSnap(DocumentSnapshot documentSnapshot){
    var snap = documentSnapshot.data() as Map<String,dynamic>?;

    return UserModel(
      email: snap?["email"],
      name: snap?["name"],
      password: snap?["password"],
      uid: snap?["uid"],
      userName: snap?["userName"],
    );
  }
}