import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Screens/Auth/Login.dart';
import 'package:flutter_netsocialapp/Screens/Welcome/welcomeOne.dart';
import 'package:flutter_netsocialapp/Screens/Welcome/welcomeThree.dart';
import 'package:flutter_netsocialapp/Screens/Welcome/welcomeTwo.dart';
import 'package:flutter_netsocialapp/constants/navigate.dart';

class WelcomeMain extends StatefulWidget {
  const WelcomeMain({super.key});

  @override
  State<WelcomeMain> createState() => _WelcomeMainState();
}

class _WelcomeMainState extends State<WelcomeMain> {

  final PageController _pageController = PageController();

  int _page = 0;

  void onChange(int page){
    setState(() {
      _page = page;
    });
  }


  void jumgPage(int page){
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(
          onPressed: (){
            MainRoutes.instance.pushAndGo(widget: Login(), context: context);
          }, 
          child: Text("Atla",style: TextStyle(color: Colors.black),),
          style: TextButton.styleFrom(
            foregroundColor: Color(0xff9896f0),
          ),
          ),
          ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              controller: _pageController,
              onPageChanged: onChange,
              children: [
                WelcomeOne(),
                WelcomeTwo(),
                WelcomeThree(),
              ],
            ),
          ),
          _page == 0 ? Expanded(child: CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff9896f0),
            foregroundColor: Colors.white,
            child: IconButton(
              onPressed: (){
              _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubicEmphasized);
              }, 
              icon: Icon(Icons.arrow_forward_ios),
              ),
          ),
            ) : _page == 1 ? Expanded(child: CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff9896f0),
            foregroundColor: Colors.white,
            child: IconButton(
              onPressed: (){
              _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubicEmphasized);
              }, 
              icon: Icon(Icons.arrow_forward_ios),
              ),
          ),
            ) : _page == 2 ? Expanded(child: CircleAvatar(
              maxRadius: 30,
            backgroundColor: Color(0xff9896f0),
            foregroundColor: Colors.white,
              child: IconButton(onPressed: (){
                MainRoutes.instance.pushAndGo(widget: Login(), context: context);
              },
              icon: Icon(Icons.play_circle,size: 30,),
              ),
            )
            ) : Expanded(child: _WelcomeButton(),
            )
        ],
      ),
    );
  }

  CircleAvatar _WelcomeButton() {
    return CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xff9896f0),
          foregroundColor: Colors.white,
          child: IconButton(
            onPressed: (){
            _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuart);
            }, 
            icon: Icon(Icons.arrow_forward_ios),
            ),
        );
  }
}