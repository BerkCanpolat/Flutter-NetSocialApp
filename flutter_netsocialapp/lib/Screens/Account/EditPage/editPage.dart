import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/constants/picker.dart';
import 'package:flutter_netsocialapp/model/userModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final snap;
  const EditScreen({super.key,required this.snap});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Uint8List? _file;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _userName = TextEditingController();

  void _selectPhoto() async{
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (BuildContext context) {
       return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 18),
         child: Container(
          height: 140,
           child: Column(
              children: [
                InkWell(
                  onTap: () async{
                    Uint8List fi = await selectPickImage(ImageSource.gallery);
                    setState(() {
                      _file = fi;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.photo_outlined,size: 30,),
                      SizedBox(width: 5,),
                      Text("Galeriden Seç",style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () async{
                    Uint8List fi = await selectPickImage(ImageSource.camera);
                    setState(() {
                      _file = fi;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.photo_camera_outlined,size: 30,),
                      SizedBox(width: 5,),
                      Text("Kameradan Çek",style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.cancel_outlined,size: 30,color: Colors.red,),
                      SizedBox(width: 5,),
                      Text("İptal",style: TextStyle(fontSize: 15,color: Colors.red),)
                    ],
                  ),
                ),
              ],
            ),
         ),
       );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profili Düzenle",style: TextStyle(color: Colors.black),
      ),
      leading: CupertinoButton(
        child: Icon(Icons.arrow_back,color: Color(0xff9896f0),), 
        onPressed: (){
        Navigator.of(context).pop();
      }
      ),
      actions: [
        TextButton(onPressed: () async{
          ProviderNet? providerNet = Provider.of<ProviderNet?>(context,listen: false);
          UserModel userModel = providerNet!.getUserProvider!.copyWith(name: _name.text,userName: _userName.text);
          await providerNet.updateUserProfil(_file!, userModel, context);


        }, child: Icon(Icons.check))
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            _file == null ? CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _selectPhoto,
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage("https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2pvYjcyNC0xODctcC5wbmc.png"),
              ),
            ) :
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _selectPhoto,
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: MemoryImage(_file!),
              ),
            ),
            SizedBox(height: 100,),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                hintText: "Ad"
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _userName,
              decoration: InputDecoration(
                hintText: "Kullanıcı Adı"
              ),
            ),
          ],
        ),
      ),
    );
  }
}