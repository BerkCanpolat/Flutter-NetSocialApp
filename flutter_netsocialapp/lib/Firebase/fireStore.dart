import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/storage.dart';
import 'package:flutter_netsocialapp/constants/constant.dart';
import 'package:flutter_netsocialapp/model/postModel.dart';
import 'package:uuid/uuid.dart';

class FireStore{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> userAddPost(
    String name,
    String description,
    String uid,
    String userName,
    Uint8List file,
    BuildContext context
  ) async{
    try {
      String photoUrl = await StorageMethod().storageAdd("UserPost", file, true);

      String postId = Uuid().v1();

      PostModel postModel = PostModel(
        name: name,
        description: description,
        uid: uid,
        postId: postId,
        postUrl: photoUrl,
        userName: userName,
        datePost: DateTime.now()
      );

      _firestore.collection("UserPost").doc(postId).set(postModel.toJson());
      return true;
    } catch (e) {
      cherryMessage(e.toString(), context);
      return false;
    }
  }
}