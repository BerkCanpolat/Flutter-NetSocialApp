import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Screens/AddPost/addPostScreen.dart';
import 'package:flutter_netsocialapp/Screens/floatincSCreen/actionButton.dart';
import 'package:flutter_netsocialapp/Screens/floatincSCreen/expand.dart';
import 'package:flutter_netsocialapp/Screens/home/home.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';
import 'package:flutter_netsocialapp/widget/deneme.dart';
import 'package:flutter_netsocialapp/widget/deneme2.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NetSocialApp",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Deneme(),
            SizedBox(height: 12,),
            Deneme2(),
            SizedBox(height: 12,),
            Home(),
          ],
        ),
      ),
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
          onPressed: (){
            MainRoutes.instance.pushAndGo(widget: AddPostScreen(), context: context);
          },
        ),
      ], distance: 120),
    );
  }
}