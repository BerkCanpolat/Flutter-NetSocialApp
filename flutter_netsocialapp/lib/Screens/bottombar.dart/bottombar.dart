import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/Screens/Account/accountScreen.dart';
import 'package:flutter_netsocialapp/Screens/Auth/Login.dart';
import 'package:flutter_netsocialapp/Screens/Search/searchScreen.dart';
import 'package:flutter_netsocialapp/Screens/favourite.dart';
import 'package:flutter_netsocialapp/Screens/home/homeMain.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addUserDetails();
  }

  addUserDetails() async{
    ProviderNet providerNet = Provider.of(context,listen: false);
    await providerNet.userDetailsProvider();
  }

  var sayfaDeis = [HomeMain(), SearchScreen(),FavouriteScreen(),AccountScreen(uid: FirebaseAuth.instance.currentUser!.uid)];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaDeis[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: index == 0 ? Color(0xff9896f0) : Colors.grey[600]),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore,color: index == 1 ? Color(0xff9896f0) : Colors.grey[600]),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,color: index == 2 ? Color(0xff9896f0) : Colors.grey[600]),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,color: index == 3 ? Color(0xff9896f0) : Colors.grey[600]),
            label: ""
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}