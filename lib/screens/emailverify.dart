import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/screens/home_page.dart';
import 'package:gamereview/utils/images.dart';
import 'package:gamereview/widgets/alerts.dart';
import 'package:provider/provider.dart';

class EmailVerify extends StatefulWidget {
  EmailVerify({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  bool pressed = false;
  int count = 60;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    countDown();
  }

  @override
  void dispose() {
    _timer.cancel();
    pressed = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<Authprovider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  Images.email_verify,
                  height: height * 0.55,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: height * 0.01),
                const Text(
                  "Verify your email to continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Click link sent to ${widget.user.email} to verify the email address.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                SizedBox(
                  width: width * 0.8,
                  height: height * 0.07,
                  child: TextButton(
                    onPressed: !pressed
                        ? () async {
                            setState(() {
                              pressed = !pressed;
                            });
                            _timer.cancel();
                            try {
                              bool verified = await provider.verifyEmail();
                              if (verified) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (route) => false);
                              } else {
                                setState(() {
                                  pressed = !pressed;
                                });
                                Alerts.showSnackBar(
                                    context, "Error! Email verification failed",
                                    isError: true);
                              }
                            } catch (e) {
                              setState(() {
                                pressed = !pressed;
                              });
                              Alerts.showSnackBar(context,
                                  "Something went wrong please try again",
                                  isError: true);
                            }
                          }
                        : null,
                    child: pressed
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Complete",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrangeAccent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ))),
                  ),
                ),
                Center(
                  child: TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: count == 0
                          ? () async {
                              countDown();
                              var sent =
                                  await provider.resendEmailVerification();
                              if (sent) {
                                Alerts.showSnackBar(
                                  context,
                                  "Email sent, check inbox to verify",
                                );
                              } else {
                                Alerts.showSnackBar(context,
                                    "Something went wrong please try again",
                                    isError: true);
                              }
                            }
                          : null,
                      child: Text(
                        "Resend Verification email (${count})s",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void countDown() {
    count = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        _timer.cancel();
      }
    });
  }
}
