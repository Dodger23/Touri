import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:touri/screens/tour.dart';

class Tours extends StatefulWidget {
  @override
  _ToursState createState() => _ToursState();
}

class _ToursState extends State<Tours> {
  List<String> pages = ['home', 'createTour', 'tours', 'profile'];
  var myTours = <Widget>[];
  var publicTours = <Widget>[];

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

  Future<List<Widget>> getTours(String collectionName) async {
    var tours = <Widget>[];
    var data = await fetchData(collectionName);

    for (int i = 0; i < data.length; i++) {
      tours.add(
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 0, blurRadius: 15.0),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(data[i]['tour_name'],
                        style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward,
                        color: Color(0xFF4E72E3)),
                    tooltip: 'Go to tour',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Tour(
                            tourName: data[i]['tour_name'],
                            places: data[i]['places'],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    print(tours);
    return tours;
  }

  void temp() async {
    // try {
    //   myTours = await getTours('users');
    // } catch (e) {
    //   print(e);
    // }

    try {
      publicTours = await getTours('tours');
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    temp();
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
                child: Text('Tours',
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
              ),
              Expanded(
                child: Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 2),
                    ],
                  ),

                  // child: ListView(
                  //   children: <Widget>[
                  //     getMyTours();
                  //   ],
                  // ),


                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Text(
                              'My Tours',
                              style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                            SizedBox(
                              height: 15.0,
                              width: 1.0
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(16.0),
                            //   child: Column(children: myTours),
                            // ),
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('tours').snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading");
                                }
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot tour =
                                        snapshot.data.docs[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 0,
                                                blurRadius: 15.0),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(tour['tour_name'],
                                                    style: GoogleFonts.quicksand(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18.0)),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_forward,
                                                    color: Color(0xFF4E72E3)),
                                                tooltip: 'Go to tour',
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => Tour(
                                                        tourName: tour['tour_name'],
                                                        places: tour['places'],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            // SizedBox(
                            //   height: 50.0,
                            //   width: 1.0,
                            // ),
                            // Text('Public Tours',
                            //     style: GoogleFonts.quicksand(
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 25.0)),
                            // SizedBox(
                            //   height: 15.0,
                            //   width: 1.0,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(16.0),
                            //   child: Column(children: publicTours),
                            // )
                          ],
                        ),
                      ),
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
        selectedItemColor: Color(0xFFFFD600),
        onTap: _onItemTapped,
      ),
    );
  }
}
