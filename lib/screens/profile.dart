import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touri/components/roundedButton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> pages = ['home', 'createTour', 'tours', 'profile'];
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  Map userData = new Map<String, dynamic>();
  void _onItemTapped(int index) {
    setState(() {
      if (index != 3) Navigator.pushNamed(context, pages[index]);
    });
  }

  void _logout() {
    Navigator.popUntil(context, ModalRoute.withName('login'));
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    _logout();
  }

  Future<User> getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        CollectionReference _users =
            FirebaseFirestore.instance.collection('users');
        _users.doc(user.uid).get().then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists)
                {userData = documentSnapshot.data(), print(userData)}
            });
        loggedInUser = user;
      }
    } catch (e) {}
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Color(0xFF4E72E3),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 20.0),
                child: Text('Profile',
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('users').doc(_auth.currentUser.uid).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                print(snapshot.data.docs.length);
                                return Text("Loading");
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    width: 200.0,
                                    height: 200.0,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://i.imgur.com/ktg02Wa.jpg'),
                                      minRadius: 30.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[600],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[600],
                                                spreadRadius: 3),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(snapshot.data['name'],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[600],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[600],
                                                spreadRadius: 3),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(snapshot.data['email'],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[600],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[600],
                                                spreadRadius: 3),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(snapshot.data['Age'],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0)),
                                        ),
                                      ),
                                      SizedBox(height: 50.0),
                                      RoundedButton(
                                          title: 'Logout',
                                          color: Colors.red[600],
                                          onPressed: () async {
                                            _signOut();
                                          })
                                    ],
                                  )
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF4E72E3),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Create tour',
            backgroundColor: Color(0xFF4E72E3),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'My tours',
            backgroundColor: Color(0xFF4E72E3),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xFF4E72E3),
          ),
        ],
        currentIndex: 3,
        selectedItemColor: Color(0xFFFFD600),
        onTap: _onItemTapped,
      ),
    );
  }
}
