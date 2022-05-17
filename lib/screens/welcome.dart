import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamereview/screens/signup.dart';

import 'package:gamereview/screens/login.dart';
import 'package:gamereview/utils/images.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Image.asset(
            Images.gaming,
            height: size * 0.60,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: size * 0.030,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: [
                TextSpan(
                    text: "Your one Stop place for everything gaming",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )),
              ])),
          SizedBox(
            height: size * 0.01,
          ),
          Text(
            "Signup to Begin Rating Games",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: size * 0.08,
          ),
          SizedBox(
            width: width * 0.8,
            height: size * 0.06,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                "Get started",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
            ),
          ),
          SizedBox(
            height: size * 0.01,
          ),
          SizedBox(
            width: width * 0.8,
            height: size * 0.06,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Sign in",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.black)))),
            ),
          )
        ],
      ),
    ));
  }
}
