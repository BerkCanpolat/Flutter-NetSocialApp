import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/auth.dart';
import 'package:flutter_netsocialapp/Screens/Auth/Login.dart';
import 'package:flutter_netsocialapp/constants/constant.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';
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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  bool _isLoading = false;
  bool isVisible = true;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
    _userName.dispose();
  }

  void userSignUp() async{
    _changeLoading();
    bool isValidate = signUpValidate(_email.text, _password.text, _userName.text);
    if(isValidate){
      bool isSignUp = await AuthService().signUpUser(_name.text, _email.text, _password.text, _userName.text, context);
      if(isSignUp){
        MainRoutes.instance.pushAndGo(widget: Login(), context: context);
      }
    }
    _changeLoading();
  }

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  

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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "İsim",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextfieldWidget(
                controller: _name,
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
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10,top: 20),
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
                suffiicon: Icon(
                  isVisible ? Icons.visibility_off : Icons.visibility,
                  color: Color(0xff9896f0),
                ),
                cupertino: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff9896f0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: NetSocialAppButton(
                  text: "Kaydol",
                  onPressed: userSignUp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Zaten bir hesabın var mı?",
                      style:
                          TextStyle(color: Colors.grey[800], letterSpacing: 1),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        MainRoutes.instance
                            .pushAndGo(widget: Login(), context: context);
                      },
                      child: Text(
                        "Giriş yap",
                        style: TextStyle(
                            color: Colors.grey[800],
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
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
