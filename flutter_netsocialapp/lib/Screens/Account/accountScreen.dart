import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarPhotos.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarTagged.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarVideos.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("İsim",style: TextStyle(color: Colors.black),),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CircleAvatar(
              maxRadius: 70,
              backgroundImage: NetworkImage("https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2pvYjcyNC0xODctcC5wbmc.png"),
            ),
            SizedBox(height: 10,),
            Text("@kullanici_ismi",style: TextStyle(color: Color(0xff9896f0),fontWeight: FontWeight.bold,fontSize: 20),),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("30K",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 6,),
                      Text("Followers",style: TextStyle(color: Colors.grey[800], letterSpacing: 1),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("30K",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 6,),
                      Text("Followers",style: TextStyle(color: Colors.grey[800], letterSpacing: 1),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("30K",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 6,),
                      Text("Followers",style: TextStyle(color: Colors.grey[800], letterSpacing: 1),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            TabBar(
              labelColor: Color(0xff9896f0),
              indicatorColor: Color(0xff9896f0),
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              indicatorWeight: 4,
              tabs: [
                Tab(child: Text("Fotoğraflar"),),
                Tab(child: Text("Videolar"),),
                Tab(child: Text("Etiketler"),),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TabbarPhotosScreen(),
                  TabbarVideosScreen(),
                  TabbarTaggedScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}