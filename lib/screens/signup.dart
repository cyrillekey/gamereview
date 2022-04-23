import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/screens/emailverify.dart';

import 'package:gamereview/screens/home_page.dart';
import 'package:gamereview/screens/login.dart';

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
  bool busy = false;
  @override
  void dispose() {
    super.dispose();
    busy = false;
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                          text: 'Get started',
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
                      "Create an account to get started",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: formKey,
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
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  busy = !busy;
                                });
                                try {
                                  User? uid = await authProvider.signupUser(
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
                                "Sign Up",
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Already Have an account ?',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Login',
                              style: TextStyle(
                                  color: Color(0xfff79c4f),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    )
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
