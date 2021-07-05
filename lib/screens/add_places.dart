import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touri/components/roundedButton.dart';
import 'package:touri/components/listViewPlaces.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:touri/screens/adjust_time.dart';

class AddPlaces extends StatefulWidget {
  final String tourName;
  AddPlaces({@required this.tourName});
  @override
  _AddPlacesState createState() => _AddPlacesState(tourName: tourName);
}

enum Type { Restaurants, Cafes, Temples, Places }

class _AddPlacesState extends State<AddPlaces> {
  String tourName;
  _AddPlacesState({@required this.tourName});
  Type selectedType = Type.Restaurants;
  var _stream =
      FirebaseFirestore.instance.collection('restaurants').snapshots();
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  Map userData = new Map<String, dynamic>();
  bool loading = true;

  List<String> pages = ['home', 'createTour', 'tours', 'profile'];
  List<List<String>> tour = new List.generate(6, (i) => []);
  void _onItemTapped(int index) {
    setState(() {
      Navigator.pushNamed(context, pages[index]);
    });
  }

  void getCurrentUser() async {
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
                child: Text('Add Places',
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
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xFF4E72E3),
                            thumbColor: Color(0xFF4E72E3),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20.0),
                            overlayColor: Color(0xFFbfecff),
                          ),
                          child: Slider(
                            value: 50.0,
                            min: 0.0,
                            max: 100.0,
                            inactiveColor: Colors.grey,
                            onChanged: (value) {
                              value = 50.0;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Pick name',
                                style: GoogleFonts.quicksand(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                            Text('Add places',
                                style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                            Text('Adjust time',
                                style: GoogleFonts.quicksand(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                          ],
                        ),
                      ),
                      Container(
                        height: 80.0,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RoundedButton(
                                        title: 'Restaurants',
                                        color: selectedType == Type.Restaurants
                                            ? Colors.amber
                                            : Colors.white,
                                        borderColor: Colors.black,
                                        textColor: Colors.black,
                                        minWidth: 100.0,
                                        onPressed: () {
                                          setState(() {
                                            selectedType = Type.Restaurants;
                                            _stream = FirebaseFirestore.instance
                                                .collection('restaurants')
                                                .snapshots();
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RoundedButton(
                                        title: 'Cafes',
                                        color: selectedType == Type.Cafes
                                            ? Colors.amber
                                            : Colors.white,
                                        borderColor: Colors.black,
                                        textColor: Colors.black,
                                        minWidth: 100.0,
                                        onPressed: () {
                                          setState(() {
                                            selectedType = Type.Cafes;
                                            _stream = FirebaseFirestore.instance
                                                .collection('cafes')
                                                .snapshots();
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RoundedButton(
                                        title: 'Temples',
                                        color: selectedType == Type.Temples
                                            ? Colors.amber
                                            : Colors.white,
                                        borderColor: Colors.black,
                                        textColor: Colors.black,
                                        minWidth: 100.0,
                                        onPressed: () {
                                          setState(() {
                                            selectedType = Type.Temples;
                                            _stream = FirebaseFirestore.instance
                                                .collection('temples')
                                                .snapshots();
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RoundedButton(
                                        title: 'Places',
                                        color: selectedType == Type.Places
                                            ? Colors.amber
                                            : Colors.white,
                                        borderColor: Colors.black,
                                        textColor: Colors.black,
                                        minWidth: 100.0,
                                        onPressed: () {
                                          setState(() {
                                            selectedType = Type.Places;
                                            _stream = FirebaseFirestore.instance
                                                .collection('places')
                                                .snapshots();
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: StreamBuilder(
                            stream: _stream,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                print(snapshot.data.docs.length);
                                return Text("Loading");
                              }
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot rest =
                                      snapshot.data.docs[index];
                                  return Place(
                                    name: rest['Name'],
                                    image: rest['Image'],
                                    rate: rest['Rate'],
                                    description: rest['Description'],
                                    from: rest['From'],
                                    to: rest['To'],
                                    location: rest['Location'],
                                    onPressed: (selected) {
                                      if (!selected &&
                                          tour[0].contains(rest['Name'])) {
                                        tour[0].remove(rest['Name']);
                                        tour[1].remove(rest['Image']);
                                        tour[2].remove(rest['Rate'].toString());
                                        tour[3].remove(rest['Location']);
                                        tour[4].remove(rest['Lat'].toString());
                                        tour[5].remove(rest['Lng'].toString());
                                      } else if (selected &&
                                          !tour[0].contains(rest['Name'])) {
                                        tour[0].add(rest['Name']);
                                        tour[1].add(rest['Image']);
                                        tour[2].add(rest['Rate'].toString());
                                        tour[3].add(rest['Location']);
                                        tour[4].add(rest['Lat'].toString());
                                        tour[5].add(rest['Lng'].toString());
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      RoundedButton(
                          title: 'Continue',
                          color: Color(0xFF4E72E3),
                          onPressed: () {
                            print(tour);
                            if (tour.length > 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdjustTime(
                                            tourName: tourName,
                                            places: tour,
                                          )));
                            }
                          }),
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
        currentIndex: 1,
        selectedItemColor: Color(0xFFFFD600),
        onTap: _onItemTapped,
      ),
    );
  }
}
