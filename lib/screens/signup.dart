import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/screens/emailverify.dart';

import 'package:gamereview/screens/home_page.dart';
import 'package:gamereview/screens/sing_in.dart';
import 'package:gamereview/utils/images.dart';
import 'package:provider/provider.dart';

import '../widgets/Alerts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool pressed = false;
  @override
  void dispose() {
    pressed = false;
    super.dispose();
  }

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
                      image:
                          DecorationImage(image: AssetImage(Images.singup)))),
              SizedBox(
                height: height * 0.01,
              ),
              Center(
                child: Text(
                  "Signup",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(height: height * 0.005),
              Center(
                  child: Text(
                "Create an account to begin",
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
                      SizedBox(
                        height: height * 0.06,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: pressed
                              ? null
                              : () async {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      pressed = !pressed;
                                    });

                                    try {
                                      User? uid = await authProvider.signupUser(
                                          emailController.text.trim(),
                                          passwordController.text.trim());
                                      if (uid != null && uid.emailVerified) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      } else if (uid != null &&
                                          !uid.emailVerified) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EmailVerify(
                                                      user: uid,
                                                    )));
                                      }
                                    } on FirebaseAuthException catch (e) {
                                      setState(() {
                                        pressed = !pressed;
                                      });
                                      Alerts.show(context, "Error", e.message!);
                                    } catch (e) {
                                      setState(() {
                                        pressed = !pressed;
                                      });
                                      Alerts.show(context, "Error",
                                          "An error occured try again");
                                    }
                                  }
                                },
                          child: pressed
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              fixedSize: MaterialStateProperty.all(
                                  Size(width * 0.5, height * 0.07)),
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
                            onPressed: () async {
                              User? user = await authProvider.siginWithGoogle();
                              if (user != null && user.emailVerified) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
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
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Already Have an account ?",
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
