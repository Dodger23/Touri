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
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  var restaurants = <Widget>[];
  var cafes = <Widget>[];
  var temples = <Widget>[];
  var places = <Widget>[];
  Map userData = new Map<String, dynamic>();
  var show = <Widget>[];
  bool loading = true;

  List<String> pages = ['home', 'createTour', 'myTours', 'profile'];
  List<String> tour = <String>[];
  void _onItemTapped(int index) {
    setState(() {
      Navigator.pushNamed(context, pages[index]);
    });
  }

  Future<List> fetchData(String collectionName) async {
    CollectionReference _collection =
        FirebaseFirestore.instance.collection(collectionName);
    QuerySnapshot querySnapshot = await _collection.get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }

  Future<List<Widget>> getData(String collectionName) async {
    List data = await fetchData(collectionName);
    var dataWidgetList = <Widget>[];
    for (int i = 0; i < data.length; i++) {
      dataWidgetList.add(
        Place (
          name: data[i]['Name'],
          image: data[i]['Image'],
          rate: data[i]['Rate'],
          description: data[i]['Description'],
          from: data[i]['From'],
          to: data[i]['To'],
          location: data[i]['Location'],
          onPressed: (selected) {
            if (!selected && tour.contains(data[i]['Name'])) {
              tour.remove(data[i]['Name']);
              print(collectionName);
            } else if (selected && !tour.contains(data[i]['Name'])) {
              tour.add(data[i]['Name']);
              print(collectionName);
            }
            print(tour);
          },
        ),
      );
    }
    return dataWidgetList;
  }

  void temp() async {
    try {
      restaurants = await getData('restaurants');
    } catch (e) {
      print(e);
    }
    cafes = await getData('cafes');
    temples = await getData('temples');
    places = await getData('places');
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
    temp();
    getCurrentUser();
    show = restaurants;
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
                                            show = restaurants;
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
                                            show = cafes;
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
                                            show = temples;
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
                                            show = places;
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
                              child: ListView(
                        shrinkWrap: true,
                        children: show,
                      ))),
                      RoundedButton(
                          title: 'Continue',
                          color: Color(0xFF4E72E3),
                          onPressed: () {
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
