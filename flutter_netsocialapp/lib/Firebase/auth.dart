import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/constants/constant.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<UserModel> userDetailsFirebase() async{
    User user = _auth.currentUser!;

    DocumentSnapshot documentSnapshot = await _firestore.collection("Users").doc(user.uid).get();

    return UserModel.fromSnap(documentSnapshot);
  }



  Future<bool> loginuser(
     String email,
     String password,
     BuildContext context
  ) async{
    try {
      if(email.isNotEmpty || password.isNotEmpty){
      showLoaderDialog(context);
      Navigator.of(context,rootNavigator: true).pop;
        await _auth.signInWithEmailAndPassword(email: email, password: password);
      }else{
        showMessage("Giriş Başarısız");
      }
      Navigator.of(context).pop;
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.of(context,rootNavigator: true).pop;
      Navigator.of(context).pop;
      showMessage(e.code.toString());
      return false;
    }
  }



  Future<bool> signUpUser(
     String name,
     String email,
     String password,
     String username,
     BuildContext context,
  ) async{
    try {
      if(name.isNotEmpty || email.isNotEmpty || password.isNotEmpty){
        showLoaderDialog(context);
        UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        UserModel userModel = UserModel(
          email: email,
          name: name,
          password: password,
          uid: credential.user!.uid,
          userName: username,
          userPhoto: null,
          follower: [],
          following: [],
        );

        await _firestore.collection("Users").doc(credential.user!.uid).set(userModel.toJson());
      }else{
        showMessage("Kayıt Olunamadı");
      }
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.of(context).pop;
      showMessage(e.code.toString());
      return false;
    }
  }
}