import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/screens/emailverify.dart';
import 'package:gamereview/screens/home_page.dart';
import 'package:gamereview/screens/welcome.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  FirebaseAuth auth = FirebaseAuth.instance;
  Widget home = WelcomePage();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.providerData.length == 1) {
              home = snapshot.data!.emailVerified
                  ? HomePage()
                  : EmailVerify(user: snapshot.data!);
            } else {
              Provider.of<Authprovider>(context, listen: false).user =
                  snapshot.data;
              home = HomePage();
            }
          } else {
            home = WelcomePage();
          }
          return MaterialApp(
              title: 'Game Review',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.pink,
              ),
              home: home);
        });
  }
}
