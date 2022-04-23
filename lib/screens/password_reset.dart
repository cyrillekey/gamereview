import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamereview/controllers/auth_provider.dart';
import 'package:gamereview/screens/login.dart';
import 'package:gamereview/utils/images.dart';
import 'package:gamereview/widgets/alerts.dart';
import 'package:provider/provider.dart';

class PasswordReset extends StatefulWidget {
  PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool busy = false;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                "Password Reset",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.email_verify),
                          fit: BoxFit.cover))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Email address"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email address cannot be null';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: "example@mail.com",
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xfff3f3f4)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextButton(
                onPressed: !busy
                    ? () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            busy = !busy;
                          });
                          try {
                            bool success = await Provider.of<Authprovider>(
                                    context,
                                    listen: false)
                                .resetUserPassword(emailController.text.trim());
                            if (success) {
                              Alerts.showSnackBar(context,
                                  "Password resent instructions have been sent to your email");
                              setState(() {
                                busy = !busy;
                                visible = true;
                              });
                            }
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              busy = !busy;
                            });
                            Alerts.showSnackBar(context, e.message!,
                                isError: true);
                          } catch (e) {
                            setState(() {
                              busy = !busy;
                            });
                            Alerts.showSnackBar(context, "Something went wrong",
                                isError: true);
                          }
                        }
                      }
                    : null,
                child: !busy
                    ? Text(
                        "Send Reset Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    : CircularProgressIndicator(
                        color: Colors.white,
                      ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xfffbb448)),
                    fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width * 0.8, 60))),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: visible,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xfffbb448)),
                        fixedSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width * 0.8, 60))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
