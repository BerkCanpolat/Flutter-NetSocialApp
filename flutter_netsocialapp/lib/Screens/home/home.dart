import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    );
  }
}