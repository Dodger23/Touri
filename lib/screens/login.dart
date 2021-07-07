import 'package:flutter/material.dart';
import 'package:touri/constants.dart';
import 'package:touri/components/roundedButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: FittedBox(
                  child: Image.asset('assets/images/login_header.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Hello, welcome back!',
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    Text(
                      'Please login to continue',
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: "Email"),
                      ),
                      TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: "Password"),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  RoundedButton(
                      title: "Login",
                      color: Color(0xff4E72E3),
                      onPressed: () async {
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, 'createTour');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an account?'),
                      GestureDetector(
                          child: Text(
                            " SignUp",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, 'registeration');
                          }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
