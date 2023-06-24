import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/Screens/Account/EditPage/editPage.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarPhotos.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarTagged.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarVideos.dart';
import 'package:flutter_netsocialapp/Screens/bottombar.dart/bottombar.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  final String uid;
  const AccountScreen({super.key,required this.uid});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  int followers = 0;
  int following = 0;
  int like = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userGet();
  }

  userGet() async{
    try {
      var userSnap = await FirebaseFirestore.instance.collection("Users").doc(widget.uid).get();
      var postSnap = await FirebaseFirestore.instance.collection("UserPost").doc(widget.uid).get();

      followers = userSnap.data()!["followers"].length;
      following = userSnap.data()!["following"].length;
      like = postSnap.data()!["like"].length;

    } catch (e) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProviderNet>(context).getUserProvider;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(user!.name!,style: TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: GestureDetector(onTap: (){MainRoutes.instance.pushAndRemoveUntil(widget: BottomNavigationScreen(), context: context);},child: Icon(Icons.arrow_back,color: Colors.black,),),
        ),
        body: Column(
          children: [
            user.userPhoto == null ? CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                MainRoutes.instance.pushAndGo(widget: EditScreen(snap: widget.uid), context: context);
              },
              child: CircleAvatar(
                maxRadius: 70,
                backgroundImage: NetworkImage("https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2pvYjcyNC0xODctcC5wbmc.png"),
              ),
            ) :
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                MainRoutes.instance.pushAndGo(widget: EditScreen(snap: widget.uid), context: context);
              },
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(user.userPhoto!),
              ),
            ),
            SizedBox(height: 10,),
            Text("@${user.userName!}",style: TextStyle(color: Color(0xff9896f0),fontWeight: FontWeight.bold,fontSize: 20),),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("$followers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 6,),
                      Text("Takipçi",style: TextStyle(color: Colors.grey[800], letterSpacing: 1),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("$following",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 6,),
                      Text("Takip",style: TextStyle(color: Colors.grey[800], letterSpacing: 1),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("$like",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 6,),
                      Text("Beğeni",style: TextStyle(color: Colors.grey[800], letterSpacing: 1),)
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
                  TabbarPhotosScreen(uid: widget.uid),
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