import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/auth.dart';
import 'package:flutter_netsocialapp/Firebase/storage.dart';
import 'package:flutter_netsocialapp/Screens/Account/accountScreen.dart';
import 'package:flutter_netsocialapp/Screens/bottombar.dart/bottombar.dart';
import 'package:flutter_netsocialapp/Screens/home/homeMain.dart';
import 'package:flutter_netsocialapp/constants/constant.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';

class ProviderNet with ChangeNotifier {
  UserModel? _user;
  final AuthService _authService = AuthService();

  UserModel? get getUserProvider => _user;

  Future<void> userDetailsProvider() async {
    UserModel? user = await _authService.userDetailsFirebase();
    _user = user;
    notifyListeners();
  }

  Future<void> updateUserProfil(
      Uint8List file, UserModel userModel, BuildContext context) async {
    if (file == null) {
      showLoaderDialog(context);
      _user = userModel;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(_user?.uid)
          .update(_user!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      MainRoutes.instance.pushAndRemoveUntil(widget: BottomNavigationScreen(), context: context);
    } else {
      showLoaderDialog(context);
      String imageUrl =
          await StorageMethod().storageAdd("UsersProfilePhoto", file, false);
      _user = userModel.copyWith(userPhoto: imageUrl);
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(_user?.uid)
          .update(_user!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      MainRoutes.instance.pushAndRemoveUntil(widget: BottomNavigationScreen(), context: context);
    }
    cherryMessage("Profil Güncellendi!", context);
    notifyListeners();
  }
}
