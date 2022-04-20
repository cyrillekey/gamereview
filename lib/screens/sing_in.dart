// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_signin_button/button_builder.dart';

import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/screens/home_page.dart';
import 'package:gamereview/screens/signup.dart';

import 'package:gamereview/services/service_locator.dart';
import 'package:gamereview/utils/images.dart';
import 'package:gamereview/widgets/Alerts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<Authprovider>(builder: (context, authProvider, child) {
        return SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
            ),
            child: Column(children: [
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                  width: width,
                  height: height * 0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.login_picture)))),
              SizedBox(
                height: height * 0.01,
              ),
              Center(
                child: Text(
                  "Welcome back!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(height: height * 0.005),
              Center(
                  child: Text(
                "Login to your existing account",
                style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              )),
              SizedBox(
                height: height * 0.060,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email cannot be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.lightBlue,
                            labelText: "Email address",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.lightBlue,
                              ),
                            ),
                            focusColor: Colors.lightBlue,
                            prefixIconColor: Colors.lightBlue,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 2),
                                borderRadius: BorderRadius.circular(40)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.lightBlue, width: 4),
                                borderRadius: BorderRadius.circular(40))),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length < 6) {
                            return 'Password to short';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Password",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.lock,
                                color: Colors.lightBlue,
                              ),
                            ),
                            focusColor: Colors.lightBlue,
                            prefixIconColor: Colors.lightBlue,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 2),
                                borderRadius: BorderRadius.circular(40)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.lightBlue, width: 4),
                                borderRadius: BorderRadius.circular(40))),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () {},
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(color: Colors.grey),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              Alerts.showProgressDialog(context, "Loading");
                              try {
                                String? uid = await authProvider.loginUser(
                                    emailController.text.trim(),
                                    passwordController.text.trim());
                                if (uid != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                }
                              } on FirebaseAuthException catch (e) {
                                Navigator.pop(context);
                                Alerts.show(context, "Error", e.message!);
                              } catch (e) {
                                Navigator.pop(context);
                                Alerts.show(context, "Error",
                                    "An error occured try again");
                              }
                            }
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              fixedSize: MaterialStateProperty.all(Size(
                                  MediaQuery.of(context).size.width * 0.5,
                                  height * 0.06)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue[900]!)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Center(
                        child: Text(
                          "Or",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[400]),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SignInButtonBuilder(
                            text: "Google",
                            backgroundColor: Colors.redAccent,
                            icon: FontAwesome.google,
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            width: 150,
                            height: 40,
                            onPressed: () {
                              authProvider.siginWithGoogle();
                            },
                          ),
                          SignInButtonBuilder(
                            icon: Icons.facebook,
                            backgroundColor: Colors.blue,
                            text: "Facebook",
                            height: 40,
                            onPressed: () {
                              Alerts.showSnackBar(context, "Signing up");
                            },
                            width: 150,
                          )
                        ],
                      ),
                      Center(
                        child: TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: Text(
                              "Dont Have an account?",
                              style: TextStyle(),
                            )),
                      ),
                    ],
                  ))
            ]),
          ),
        ));
      }),
    );
  }
}
