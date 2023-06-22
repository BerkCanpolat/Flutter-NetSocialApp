import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/auth.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';

class ProviderNet with ChangeNotifier {
  UserModel? _user;
  final AuthService _authService = AuthService();

  UserModel? get getUserProvider => _user;

  Future<void> userDetailsProvider() async{
    UserModel? user = await _authService.userDetailsFirebase();
    _user = user;
    notifyListeners();
  }
}