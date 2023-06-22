import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/fireStore.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/Screens/bottombar.dart/bottombar.dart';
import 'package:flutter_netsocialapp/constants/constant.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';
import 'package:flutter_netsocialapp/constants/picker.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';
import 'package:flutter_netsocialapp/widget/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _desc = TextEditingController();
  Uint8List? _file;
  bool _isLoading = false;

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _postAdd(
    String name,
    String userName,
    String uid,
  ) async{
    _changeLoading();
    bool isCorrect = await sharePhoto(_file!, _desc.text, context);
    // setState(() {
    //   _desc.text = "";
    // });
    if(isCorrect){
      bool isPost = await FireStore().userAddPost(name, _desc.text, uid, userName, _file!, context);
      if(isPost){
        _changeLoading();
        MainRoutes.instance.pushAndRemoveUntil(widget: BottomNavigationScreen(), context: context);
        cherryMessage("Post Başarıyla Paylaşıldı!", context);
      }else{
        _changeLoading();
        cherryMessage("Post Başarısız!", context);
      }
    } 
  }


  void _pickImage() async{
    Uint8List _image = await selectPickImage(ImageSource.gallery);
    setState(() {
      _file = _image;
    });
  }

  void clear(){
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<ProviderNet>(context).getUserProvider;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yeni Paylaşım",
          style: TextStyle(color: Colors.black),
        ),
        leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.arrow_back,
              color: Color(0xff9896f0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _file == null ? CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _pickImage,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  dashPattern: [10, 10],
                  color: Color(0xff9896f0),
                  strokeWidth: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 209,bottom: 209,left: 100,right: 100),
                    child: Text(
                          "Resim Yükle",
                          style: TextStyle(
                              color: Colors.black, letterSpacing: 1, fontSize: 25),
                        ),
                  ),
                ),
              ),
            ) :
            Center(child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(_file!,width: 350,height: 450,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _desc,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Bir açıklama yaz..."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 45,
                    child: OutlinedButton(
                      onPressed: clear,
                      child: Text(
                        "Sil",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 150,
                    child: NetSocialAppButton(
                      text: "Paylaş",
                      onPressed: () => _postAdd(user!.name!, user.userName!, user.uid!),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
