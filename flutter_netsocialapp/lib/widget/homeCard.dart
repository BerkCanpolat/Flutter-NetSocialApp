import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/Screens/Comment/commentScreen.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeCartWidget extends StatefulWidget {
  final snap;
  const HomeCartWidget({super.key,this.snap});

  @override
  State<HomeCartWidget> createState() => _HomeCartWidgetState();
}

class _HomeCartWidgetState extends State<HomeCartWidget> {

  int commentlen = 0;

  commentLen() async{
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance.collection("UserPost").doc(widget.snap["postId"]).collection("Comments").get();

      commentlen = snap.docs.length;
      setState(() {});
    } catch (e) {
      e.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentLen();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProviderNet>(context).getUserProvider;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        SizedBox(height: 20,),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              user?.userPhoto == null ? CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage("https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2pvYjcyNC0xODctcC5wbmc.png"),
              ) :
              CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage(user!.userPhoto!),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user!.name!,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 7,),
                  Text("@${user.userName}",style: TextStyle(fontSize: 12,color: Colors.grey[800]),),
                ],
              ),
              Container(
                width: 210,
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return Dialog(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              "Sil"
                            ].map((e) => InkWell(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
                                child: Text(e),
                              ),
                            )
                            ).toList()
                          ),
                        );
                      },
                      );
                  }, child: Icon(Icons.more_horiz,color: Colors.black,)),
              ),
            ],
          ),
        ),
        SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(widget.snap["postUrl"],fit: BoxFit.cover)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 2,right: 12),
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(Icons.favorite_border,color: Colors.black,), 
                onPressed: (){}
                ),
                Text("200 like"),
                SizedBox(width: 10,),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(Icons.maps_ugc_outlined,color: Colors.black,), 
                onPressed: (){
                  MainRoutes.instance.pushAndGo(widget: CommentScreen(snap: widget.snap,), context: context);
                }
                ),
                Text("${commentlen} yorum"),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(DateFormat.yMMMd().format(widget.snap["datePost"].toDate()),style: TextStyle(fontSize: 12,color: Colors.grey[800]),)
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(widget.snap["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              Container(
                padding: EdgeInsets.only(top: 5),
                width: 300,
                child: Text(widget.snap["description"],style: TextStyle(color: Colors.grey[800],fontSize: 13,letterSpacing: 1),),
              )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}