import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touri/constants.dart';
import 'package:touri/components/roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  final _auth = FirebaseAuth.instance;

  String name, email, age, password;
  void addUserInfo() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final _auth = FirebaseAuth.instance;
    users.doc(_auth.currentUser.uid).set(
      {
        'name': name,
        'email' : email,
        'Age' : age,
        'tours': <Map<String, dynamic>>[]
      }
    );
  }

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
                flex: 6,
                child: Image.asset('assets/images/signup.png'),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Create a new Account',
                  style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          name = value;
                        },
                        keyboardType: TextInputType.name,
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: "Name"),
                      ),
                      TextField(
                        onChanged: (value) {
                          age = value;
                        },
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: "Age"),
                      ),
                      TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
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
              RoundedButton(
                  title: "Sign Up",
                  color: Color(0xff4E72E3),
                  onPressed: () async {
                    try {
                      final newUser = await _auth
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) => {addUserInfo()});
                      if (newUser != null) {
                        Navigator.pushNamed(context, 'home');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
