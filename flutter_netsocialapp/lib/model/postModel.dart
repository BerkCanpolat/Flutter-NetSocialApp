import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel{
  final String? postId;
  final String? name;
  final String? postUrl;
  final String? uid;
  final DateTime? datePost;
  final String? description;
  final String? userName;
  final like;
  final String? profilePick;


  PostModel({
    required this.postId,
    required this.name,
    required this.postUrl,
    required this.uid,
    required this.datePost,
    required this.description,
    required this.userName,
    required this.like,
    this.profilePick,
  });

  Map<String,dynamic> toJson() => {
    "postId":postId,
    "name":name,
    "postUrl":postUrl,
    "uid":uid,
    "datePost":datePost,
    "description":description,
    "userName":userName,
    "like":like,
    "profilePick":profilePick,
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
      like: snap?["like"],
      profilePick: snap?["profilePick"],
    );
  }

    PostModel? copyWith({
    String? name,profilePick,userName
    }) => 
    PostModel(
      name: name??this.name,
      description: description,
      userName: userName??this.userName,
      profilePick: profilePick??this.profilePick,
      like: [],
      datePost: DateTime.now(),
      postId: postId,
      postUrl: postUrl,
      uid: uid
    );
}