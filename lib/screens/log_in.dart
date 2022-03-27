import 'package:flutter/material.dart';
import 'package:gamereview/screens/sing_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
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
}
