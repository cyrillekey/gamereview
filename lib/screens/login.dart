// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/screens/emailverify.dart';
import 'package:gamereview/screens/home_page.dart';
import 'package:gamereview/screens/signup.dart';
import 'package:gamereview/services/service_locator.dart';
import 'package:gamereview/utils/clip_painter.dart';
import 'package:gamereview/utils/images.dart';
import 'package:gamereview/widgets/alerts.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool busy = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    busy = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: height,
      child: Stack(
        children: [
          Consumer<Authprovider>(builder: (context, authProvider, child) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.1,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: 'Welcome Back',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffe46b10))),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Text(
                      "Login to your existing account",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Email Address"),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email address cannot be null';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Color(0xfff3f3f4)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Password"),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password cannot be empty';
                                    } else if (value == null ||
                                        value.length < 6) {
                                      return 'Password to short';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Color(0xfff3f3f4)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: !busy
                          ? () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  busy = !busy;
                                });
                                try {
                                  User? uid = await authProvider.loginUser(
                                      emailController.text.trim(),
                                      passwordController.text.trim());
                                  if (uid != null && uid.emailVerified) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  } else if (uid != null &&
                                      !uid.emailVerified) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmailVerify(user: uid)));
                                  }
                                } on FirebaseAuthException catch (e) {
                                  setState(() {
                                    busy = !busy;
                                  });
                                  Alerts.show(context, "Error", e.message!);
                                } catch (e) {
                                  setState(() {
                                    busy = !busy;
                                  });
                                  Alerts.show(context, "Error",
                                      "An error occured try again");
                                }
                              }
                            }
                          : null,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: busy
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: const Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xfffbb448),
                                  Color(0xfff7892b)
                                ])),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'Forgot password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              thickness: 1,
                            ),
                          )),
                          const Text("or"),
                          const Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              thickness: 1,
                            ),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SignInButton(Buttons.Twitter, onPressed: () async {
                      try {
                        User? user = await authProvider.signUpWithTwitter();
                        if (user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
                        } else {
                          Alerts.show(context, 'Error', "Something went wrong");
                        }
                      } on FirebaseAuthException catch (e) {
                        Alerts.show(context, "Error", e.message!);
                      } catch (e) {
                        Alerts.show(context, "Error", "Something went wrong");
                      }
                    }),
                    SignInButton(Buttons.Facebook, onPressed: () async {
                      try {
                        User? user = await authProvider.signInWithFacebook();
                        if (user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
                        } else {
                          Alerts.show(context, 'Error', "Something went wrong");
                        }
                      } on FirebaseAuthException catch (e) {
                        Alerts.show(context, "Error", e.message!);
                      } catch (e) {
                        Alerts.show(context, "Error", "Something went wrong");
                      }
                    }),
                    SignInButton(Buttons.Google, onPressed: () async {
                      try {
                        User? user = await authProvider.siginWithGoogle();
                        if (user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
                        } else {
                          Alerts.show(context, 'Error', "Something went wrong");
                        }
                      } on FirebaseAuthException catch (e) {
                        Alerts.show(context, "Error", e.message!);
                      } catch (e) {
                        Alerts.show(context, "Error", "Something went wrong");
                      }
                    }),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Register',
                              style: TextStyle(
                                  color: Color(0xfff79c4f),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    ));
  }
}
