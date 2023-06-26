import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/auth.dart';
import 'package:flutter_netsocialapp/Screens/Welcome/splashScreen.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar",style: TextStyle(color: Colors.black),),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.arrow_back,color: Color(0xff9896f0),), onPressed: (){
            Navigator.of(context).pop();
          }),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){},
            leading: Icon(Icons.change_circle_outlined,color: Color(0xff9896f0),),
            title: Text("Şifre Değiştir"),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.info_outline,color: Color(0xff9896f0),),
            title: Text("Hakkımızda"),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.support,color: Color(0xff9896f0),),
            title: Text("Destek"),
          ),
          ListTile(
            onTap: (){
              AuthService().logout();
              MainRoutes.instance.pushAndRemoveUntil(widget: SplashScreen(), context: context);
            },
            leading: Icon(Icons.logout,color: Color(0xff9896f0),),
            title: Text("Çıkış"),
          ),
        ],
      ),
    );
  }
}