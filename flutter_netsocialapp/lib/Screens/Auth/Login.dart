import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Firebase/auth.dart';
import 'package:flutter_netsocialapp/Screens/Auth/SignUp.dart';
import 'package:flutter_netsocialapp/Screens/Auth/passwordComing.dart';
import 'package:flutter_netsocialapp/Screens/home/home.dart';
import 'package:flutter_netsocialapp/constants/constant.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';
import 'package:flutter_netsocialapp/widget/button.dart';
import 'package:flutter_netsocialapp/widget/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isVisible = true;
  bool isLogined = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void _changeLoading(){
    setState(() {
      isLogined = !isLogined;
    });
  }

  void userLogin() async {
    _changeLoading();
    bool isValidate = loginValidate(_email.text, _password.text);
    if (isValidate) {
      bool isLogined =
          await AuthService().loginuser(_email.text, _password.text, context);
      if (isLogined) {
        MainRoutes.instance
            .pushAndRemoveUntil(widget: Home(), context: context);
      }
    }
    _changeLoading();
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
                    "Hoşgeldin",
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
                    Icons.waving_hand_sharp,
                    color: Colors.yellow,
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Sizi görmekten mutluluk duyuyoruz. Hesabınızı kullanmak için önce giriş yapmalısınız.",
                style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
              ),
              SizedBox(
                height: kToolbarHeight,
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
                  isVisible ? Icons.visibility : Icons.visibility_off,
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
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    MainRoutes.instance
                        .pushAndGo(widget: PasswordComing(), context: context);
                  },
                  child: Text(
                    "Şifreni mi unuttun?",
                    style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
                  ),
                ),
              ),
              NetSocialAppButton(
                text: "Giriş Yap",
                onPressed: userLogin,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Henüz bir hesabın yok mu?",
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
                            .pushAndGo(widget: SignUp(), context: context);
                      },
                      child: Text(
                        "Kaydol",
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
