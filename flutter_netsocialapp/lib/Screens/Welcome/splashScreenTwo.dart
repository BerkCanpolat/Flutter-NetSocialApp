import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Screens/bottombar.dart/bottombar.dart';


class SplashScreenTwo extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenTwo>
    with SingleTickerProviderStateMixin {
      
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    Timer(
      Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigationScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset('assets/NetSocialApp2.gif'),
        ),
      ),
    );
}
    }