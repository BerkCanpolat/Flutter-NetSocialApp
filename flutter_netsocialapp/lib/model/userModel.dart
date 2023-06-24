import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? email;
  final String? name;
  final String? password;
  final String? uid;
  final String? userName;
  final String? userPhoto;
  final List? follower;
  final List? following;


  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.uid,
    required this.userName,
    this.userPhoto,
    required this.follower,
    required this.following,
  });

  Map<String,dynamic> toJson() => {
    "email":email,
    "name":name,
    "password":password,
    "uid":uid,
    "userName":userName,
    "userPhoto":userPhoto,
    "follower":follower,
    "following":following
  };

  static UserModel fromSnap(DocumentSnapshot documentSnapshot){
    var snap = documentSnapshot.data() as Map<String,dynamic>?;

    return UserModel(
      email: snap?["email"],
      name: snap?["name"],
      password: snap?["password"],
      uid: snap?["uid"],
      userName: snap?["userName"],
      userPhoto: snap?["userPhoto"],
      follower: snap?["follower"],
      following: snap?["following"],
    );
  }

    UserModel copyWith({
    String? name,userPhoto,userName
    }) => 
    UserModel(
        uid: uid,
        name: name??this.name,
        userPhoto: userPhoto??this.userPhoto,
        email: email,
        password: password,
        userName: userName??this.userName,
        follower: follower,
        following: following
    );
}