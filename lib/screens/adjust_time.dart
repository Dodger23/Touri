import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touri/components/roundedButton.dart';
import 'package:time_range_picker/time_range_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:touri/screens/tour.dart';

class AdjustTime extends StatefulWidget {
  final String tourName;
  final List places;
  AdjustTime({Key key, @required this.tourName, @required this.places})
      : super(key: key);
  @override
  _AdjustTimeState createState() =>
      _AdjustTimeState(tourName: tourName, places: places);
}

class _AdjustTimeState extends State<AdjustTime> {
  String tourName;
  List places;
  _AdjustTimeState({@required this.tourName, @required this.places});
  List<String> pages = ['home', 'createTour', 'tours', 'profile'];
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  Map userData = new Map<String, dynamic>();
  String from = '07:00';
  String to = '17:00';
  bool makePublic = false;

  void _onItemTapped(int index) {
    setState(() {
      Navigator.pushNamed(context, pages[index]);
    });
  }

  Future<void> addTourToPublic() async {
    CollectionReference tours = FirebaseFirestore.instance.collection('tours');
    tours
        .add({
          'tour_name': tourName,
          'tour_owner': userData['name'],
          'places': places[0],
          'images': places[1],
          'rates': places[2],
          'locations': places[3],
          'lats': places[4],
          'lngs': places[5]
        })
        .then((value) => print("tour Added"))
        .catchError((error) => print("Failed to add tour: $error"));
  }

  Future<void> addTour() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final _auth = FirebaseAuth.instance;
    List currentTour = <Map<String, dynamic>>[];
    users
        .doc(_auth.currentUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists)
                {
                  // currentTour = documentSnapshot.data()['tours'],
                  print(currentTour),
                  users.doc(_auth.currentUser.uid).set(
                    {
                      "tours": FieldValue.arrayUnion([
                        {
                          'places': places[0],
                          'images': places[1],
                          'rates': places[2],
                          'locations': places[3],
                          'tour_name': tourName,
                          'lats': places[4],
                          'lngs': places[5]
                        }
                      ])
                    },
                    SetOptions(merge: true),
                  ).then((value) => print('private tour added'))
                }
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
    print(places);
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
                child: Text('Adjust time',
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
                            value: 100.0,
                            min: 0.0,
                            max: 100.0,
                            inactiveColor: Color(0xFF4E72E3),
                            onChanged: (value) {
                              value = 100.0;
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
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                            Text('Adjust time',
                                style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                          ],
                        ),
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(from,
                                          style: GoogleFonts.quicksand(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0)),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[300],
                                                width: 5.0))),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 20,
                                    thickness: 5,
                                  ),
                                  Text('From')
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(to,
                                          style: GoogleFonts.quicksand(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0)),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[300],
                                                width: 5.0))),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 20,
                                    thickness: 5,
                                  ),
                                  Text('To')
                                ],
                              )
                            ],
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: makePublic,
                                onChanged: (value) {
                                  setState(() {
                                    makePublic = value;
                                  });
                                }),
                            Text('Make tour public',
                                style: GoogleFonts.quicksand(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                          ]),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF4E72E3)),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Material(
                            elevation: 0.0,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            child: MaterialButton(
                              onPressed: () async {
                                TimeRange result = await showTimeRangePicker(
                                  use24HourFormat: false,
                                  context: context,
                                );
                                setState(() {
                                  from = result.startTime
                                      .toString()
                                      .substring(10, 15);
                                  to = result.endTime
                                      .toString()
                                      .substring(10, 15);
                                });
                              },
                              minWidth: 200.0,
                              height: 42.0,
                              child: Text(
                                'Change Time',
                                style: TextStyle(color: Color(0xFF4E72E3)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      RoundedButton(
                          title: 'Start Tour',
                          color: Color(0xFF4E72E3),
                          onPressed: () {
                            if (makePublic == true) addTourToPublic();
                            addTour();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tour(
                                          tourName: tourName,
                                          places: places,
                                        )));
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
