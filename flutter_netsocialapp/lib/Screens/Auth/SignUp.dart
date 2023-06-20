import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/widget/button.dart';
import 'package:flutter_netsocialapp/widget/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _userName = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff9896f0),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kToolbarHeight,
              ),
              Row(
                children: [
                  Text(
                    "Yeni hesap oluştur",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 1,
                      color: Color(0xff9896f0),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.thumb_up_alt,
                    color: Colors.yellow,
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Lütfen devam etmek için formu doldurunuz!",
                style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
              ),
              SizedBox(
                height: kToolbarHeight,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Kullanıcı Adı",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextfieldWidget(
                controller: _userName,
                hintText: "Admin",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                suffiicon: Icon(
                  Icons.abc,
                  size: 0,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff9896f0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextfieldWidget(
                controller: _email,
                hintText: "admin@gmail.com",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                suffiicon: Icon(
                  Icons.abc,
                  size: 0,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff9896f0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text("Password",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              TextfieldWidget(
                controller: _password,
                hintText: "**********",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.text,
                obs: isVisible,
                suffiicon: Icon(isVisible ? Icons.visibility_off : Icons.visibility,color: Color(0xff9896f0),),cupertino: (){
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff9896f0),
                ),
              ),
              NetSocialAppButton(text: "Giriş Yap",onPressed: (){},),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Henüz bir hesabın yok mu?",
                style: TextStyle(color: Colors.grey[800], letterSpacing: 1),),
                    SizedBox(width: 15,),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      child: Text("Kaydol",
                                    style: TextStyle(color: Colors.grey[800], letterSpacing: 1,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
