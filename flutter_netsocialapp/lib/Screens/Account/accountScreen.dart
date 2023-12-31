import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/Screens/Account/EditPage/editPage.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarPhotos.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarTagged.dart';
import 'package:flutter_netsocialapp/Screens/Account/TabbarPage/tabbarVideos.dart';
import 'package:flutter_netsocialapp/Screens/Account/settings/settings.dart';
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
  // var userData = {};
  Map<String, dynamic>? userData;
  bool isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userGet();
  }

  userGet() async{
    try {
      setState(() {
        isLoading = true;
      });
      // _changeLoading();
      var userSnap = await FirebaseFirestore.instance.collection("Users").doc(widget.uid).get();
      var postSnap = await FirebaseFirestore.instance.collection("UserPost").where("like",arrayContains: widget.uid).get();

      if(userSnap.exists){
        setState(() {
          userData = userSnap.data() as Map<String, dynamic>;
        });
      }

      followers = userSnap.data()!["followers"].length;
      following = userSnap.data()!["following"].length;
      like = postSnap.docs.length;
      debugPrint('userData updated: $userData');

      setState(() {});
      // _changeLoading();
    } catch (e) {
      e.toString();
    }
      setState(() {
        isLoading = false;
      });
// _changeLoading();
  }

  Future<void> _refresh(){
    return Future.delayed(Duration(seconds: 2));
  }

  void _changeLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProviderNet>(context).getUserProvider;
    return DefaultTabController(
      length: 3,
      child: isLoading ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
        onRefresh: _refresh,
        child: Scaffold(
          appBar: AppBar(
            title: Text(userData!["name"].toString(),style: TextStyle(color: Colors.black),),
            centerTitle: true,
            leading: GestureDetector(onTap: (){MainRoutes.instance.pushAndRemoveUntil(widget: BottomNavigationScreen(), context: context);},child: Icon(Icons.arrow_back,color: Colors.black,),),
            actions: [
              TextButton(onPressed: (){
                MainRoutes.instance.pushAndGo(widget: SettingsScreen(), context: context);
              }, child: Icon(Icons.more_horiz,color: Colors.black,))
            ],
          ),
          body: Column(
            children: [
              userData!["userPhoto"] == null ? CupertinoButton(
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
                  backgroundImage: NetworkImage(userData!["userPhoto"]),
                ),
              ),
              SizedBox(height: 10,),
              Text("@${userData!["userName"]}",style: TextStyle(color: Color(0xff9896f0),fontWeight: FontWeight.bold,fontSize: 20),),
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
      ),
    );
  }
}