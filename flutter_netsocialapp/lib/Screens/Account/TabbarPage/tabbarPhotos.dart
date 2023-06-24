import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TabbarPhotosScreen extends StatelessWidget {
  final String uid;
  const TabbarPhotosScreen({super.key,required this.uid});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("UserPost").where("uid",isEqualTo: uid).get(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 1.5,
                  childAspectRatio: 1,
          ), 
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot snap = snapshot.data!.docs[index];
            return Image.network(
              snap["postUrl"],fit: BoxFit.cover,
            );
          },
          );
      },
    );
  }
}