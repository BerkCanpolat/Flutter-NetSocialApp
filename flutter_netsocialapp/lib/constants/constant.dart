import 'dart:typed_data';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String text){
  Fluttertoast.showToast(
    msg: text,
    backgroundColor:  Color(0xff9896f0),
  );
}

void cherryMessage(String title,BuildContext context){
  CherryToast.success(title: Text(title)).show(context);
}



showLoaderDialog(BuildContext context){
  AlertDialog dialog = AlertDialog(
    backgroundColor: Color(0xff9896f0),
    content: Builder(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: Colors.white),
          SizedBox(height: 10,),
          Text("Yükleniyor..",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ],
      );
    },),
  );
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context){
      return dialog;
    }
  );
}



bool loginValidate(String email, String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("Lütfen Tüm Kutucukları Doldurun");
    return false;
  }else if(email.isEmpty){
    showMessage("E-Mail Boş");
    return false;
  }else if(password.isEmpty){
    showMessage("Şifre Boş");
    return false;
  }else{
    return true;
  }
}

bool signUpValidate(String email, String password,String name){
  if(email.isEmpty && password.isEmpty && name.isEmpty){
    showMessage("Lütfen Tüm Kutucukları Doldurun");
    return false;
  }else if(email.isEmpty){
    showMessage("Email Boş");
    return false;
  }else if(password.isEmpty){
    showMessage("Şifre Boş");
    return false;
  }else if(name.isEmpty){
    showMessage("İsim Boş");
    return false;
  }else{
    return true;
  }
}


bool sharePhoto(Uint8List file,String descriptionPhoto,BuildContext context){
  if(file.isEmpty && descriptionPhoto.isEmpty){
    cherryMessage("Tüm bilgileri doldurmalısınız!", context);
    return false;
  }else if(file.isEmpty){
    cherryMessage("Fotoğraf Seçmelisiniz!", context);
    return false;
  }else if(descriptionPhoto.isEmpty){
    cherryMessage("Açıklama Eklemelisiniz!", context);
    return false;
  }else{
    return true;
  }
}