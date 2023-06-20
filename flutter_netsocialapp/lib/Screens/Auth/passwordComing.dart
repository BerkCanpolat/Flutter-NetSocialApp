import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/constants/image.dart';

class PasswordComing extends StatelessWidget {
  const PasswordComing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff9896f0),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Image.asset(ProjectImage.instance.passwordComing),
          SizedBox(height: kToolbarHeight,),
          Text("Çok Yakında..",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
        ],
      ),
    ); 
  }
}