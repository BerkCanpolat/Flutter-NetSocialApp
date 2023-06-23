import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({super.key,required this.snap});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProviderNet>(context).getUserProvider;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          Text(widget.snap["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(height: 2,),
          Container(
            width: 230,
            child: Text(widget.snap["text"],style: TextStyle(color: Colors.grey[800],fontSize: 13,letterSpacing: 1),),
          ),
            ],
          ),
          Text(DateFormat.Hm().format(widget.snap["commentDate"].toDate()),style: TextStyle(color: Colors.grey[800],fontSize: 13,letterSpacing: 1),)
            ],
          ),
        ],
      ),
    );
  }
}