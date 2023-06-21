import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Screens/floatincSCreen/actionButton.dart';
import 'package:flutter_netsocialapp/Screens/floatincSCreen/expand.dart';
import 'package:flutter_netsocialapp/widget/homeCard.dart';

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
        title: Text("NetSocialApp",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 15),),
      ),
      body: HomeCartWidget(),
      floatingActionButton: ExpandableFab(children: [
        ActionButton(
          icon: Icon(Icons.cancel_outlined,color: Colors.white,),
          onPressed: (){},
        ),
        ActionButton(
          icon: Icon(Icons.add_photo_alternate_outlined,color: Colors.white,),
          onPressed: (){},
        ),
        ActionButton(
          icon: Icon(Icons.add,color: Colors.white,),
          onPressed: (){},
        ),
      ], distance: 120),
    );
  }
}