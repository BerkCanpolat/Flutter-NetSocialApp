import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel{
  final String? postId;
  final String? name;
  final String? postUrl;
  final String? uid;
  final DateTime? datePost;
  final String? description;
  final String? userName;


  PostModel({
    required this.postId,
    required this.name,
    required this.postUrl,
    required this.uid,
    required this.datePost,
    required this.description,
    required this.userName,
  });

  Map<String,dynamic> toJson() => {
    "postId":postId,
    "name":name,
    "postUrl":postUrl,
    "uid":uid,
    "datePost":datePost,
    "description":description,
    "userName":userName,
  };

  static PostModel fromSnap(DocumentSnapshot documentSnapshot){
    var snap = documentSnapshot.data() as Map<String,dynamic>?;

    return PostModel(
      postId: snap?["postId"],
      name: snap?["name"],
      postUrl: snap?["postUrl"],
      uid: snap?["uid"],
      datePost: snap?["datePost"],
      description: snap?["description"],
      userName: snap?["userName"],
    );
  }
}