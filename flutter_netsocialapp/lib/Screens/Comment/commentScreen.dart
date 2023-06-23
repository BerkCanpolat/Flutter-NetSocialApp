import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/fireStore.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';
import 'package:flutter_netsocialapp/widget/commentCard.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  final snap;
  const CommentScreen({super.key,required this.snap});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  final TextEditingController _textEditing = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProviderNet>(context).getUserProvider;
    return Scaffold(
      appBar: AppBar(
        title: Text("Yorumlar",style: TextStyle(color: Colors.black),),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.arrow_back,color: Color(0xff9896f0),), 
          onPressed: (){
            Navigator.of(context).pop();
          }
          ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("UserPost").doc(widget.snap["postId"]).collection("Comments").orderBy("commentDate", descending: true).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => CommentCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              user?.userPhoto == null ? CircleAvatar(
                backgroundImage: NetworkImage("https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2pvYjcyNC0xODctcC5wbmc.png"),
              ) :
              CircleAvatar(
                backgroundImage: NetworkImage(user!.userPhoto!),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: TextField(
                  controller: _textEditing,
                  decoration: InputDecoration(
                    hintText: "Yorum Yap..",
                    border: InputBorder.none
                  ),
                )
                ),
                TextButton(
                  onPressed: () async{
                    await FireStore().userComments(user!.uid!, user.name!, widget.snap["postId"], _textEditing.text);
                  }, 
                  child: Icon(Icons.send,color: Color(0xff9896f0),),
                  ),
            ],
          ),
        ),
      )
    );
  }
}