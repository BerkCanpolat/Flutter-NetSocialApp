import 'package:flutter/material.dart';

class MainRoutes{
  static MainRoutes instance = MainRoutes();

  Future<dynamic> pushAndGo({required Widget widget,required BuildContext context}){
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }

  Future<dynamic> pushAndRemoveUntil({required Widget widget,required BuildContext context}){
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widget), (route) => false);
  }
}