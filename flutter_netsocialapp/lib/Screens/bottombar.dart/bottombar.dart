import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Screens/Auth/Login.dart';
import 'package:flutter_netsocialapp/Screens/Auth/SignUp.dart';
import 'package:flutter_netsocialapp/Screens/home/home.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  var sayfaDeis = [Home(), SignUp(),Login()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaDeis[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: index == 0 ? Color(0xff9896f0) : Colors.grey[600]),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore,color: index == 1 ? Color(0xff9896f0) : Colors.grey[600]),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,color: index == 2 ? Color(0xff9896f0) : Colors.grey[600]),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,color: index == 3 ? Color(0xff9896f0) : Colors.grey[600]),
            label: ""
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      )
    );
  }
}