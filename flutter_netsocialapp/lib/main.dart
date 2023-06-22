import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netsocialapp/Provider/provider.dart';
import 'package:flutter_netsocialapp/Screens/Welcome/splashScreen.dart';
import 'package:flutter_netsocialapp/Screens/Welcome/splashScreenTwo.dart';
import 'package:flutter_netsocialapp/constants/theme.dart';
import 'package:flutter_netsocialapp/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderNet())
      ],
      child: MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return SplashScreenTwo();
              }else if(snapshot.hasError){
                return Center(child: Text("${snapshot.error.toString()}"),);
              }
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            return SplashScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
        theme: themeData,
      ),
    );
  }
}