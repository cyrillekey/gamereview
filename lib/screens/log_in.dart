import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gamereview/models/user.dart';
import 'package:gamereview/screens/home_page.dart';
import 'package:gamereview/screens/sing_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool pressed = false;
  @override
  void dispose() {
    pressed = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              TextFormField(
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("Username"),
                    hintText: 'Enter username',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(
                height: 60,
              ),
              TextButton(
                onPressed: !pressed
                    ? () {
                        setState(() {
                          pressed = !pressed;
                        });
                        login();
                      }
                    : null,
                child: !pressed
                    ? Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )
                    : CircularProgressIndicator(
                        color: Colors.white,
                      ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    fixedSize: MaterialStateProperty.all<Size>(Size(180, 60))),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    "Signup Instead",
                    style: TextStyle(color: Colors.grey),
                  )),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      final dio = Dio();
      dio
          .get(
        "https://scaletoday-heliumharbor-8080.codio-box.uk/loginUser/${username.text}/${password.text}",
      )
          .then((value) {
        if (value.statusCode == 200) {
          User user = User.fromJson(value.data);
          saveUser(jsonEncode(user.toJson()));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {}
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("An error occured please try again"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Exit"))
                ],
              ));
    }
    setState(() {
      pressed = !pressed;
    });
  }

  Future saveUser(String user) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString("user", user);
  }
}
