import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touri/components/roundedButton.dart';
import 'package:touri/components/card.dart';
import 'package:touri/services/getDistance.dart';
import 'package:touri/services/maps.dart';
import 'package:location/location.dart';
import 'dart:math';

class Tour extends StatefulWidget {
  final String tourName;
  final List<dynamic> places;
  final int tripDuration, startTime;
  Tour(
      {Key key,
      @required this.tourName,
      @required this.places,
      @required this.tripDuration,
      this.startTime})
      : super(key: key);
  @override
  _TourState createState() => _TourState(
      tourName: tourName,
      places: places,
      tripDuration: tripDuration,
      startTime: startTime);
}

class _TourState extends State<Tour> {
  String tourName;
  List places;
  int tripDuration, startTime;
  _TourState(
      {@required this.tourName,
      @required this.places,
      @required this.tripDuration,
      this.startTime});
  int placeIndex = 0;
  double distance = 0.0;
  List<String> pages = ['home', 'createTour', 'tours', 'profile'];
  int currentPlaceIndex = 0, currentPlaceCnt = 0;
  void _onItemTapped(int index) {
    setState(() {
      Navigator.pushNamed(context, pages[index]);
    });
  }

  Future<LatLng> getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return LatLng(0.0, 0.0);
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return LatLng(0.0, 0.0);
      }
    }

    _locationData = await location.getLocation();
    return LatLng(_locationData.latitude, _locationData.longitude);
  }

  void getMiles(destinationLat, destinationLng) {
    Future<LatLng> _locationData = getLocation();
    _locationData.then((value) {
      setState(() {
        distance = getDistance(value.latitude, value.longitude,
            double.parse(destinationLat), double.parse(destinationLng));
      });
      print(distance);
    });
  }

  String visitTime() {
    double spendingTime = tripDuration / places.length;
    int recommendedTime = spendingTime.toInt() * currentPlaceIndex + startTime;
    int minutes = ((spendingTime - spendingTime.toInt()) * 100).toInt() *
        currentPlaceIndex;
    print(minutes);
    if (minutes > 59) {
      recommendedTime += 1;
      minutes -= 60;
    }

    return recommendedTime.toString() +
        ':' +
        (minutes == 0 ? "00" : minutes.toInt().toString());
  }

  @override
  void initState() {
    getMiles(places[4][0], places[5][0]);
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
                child: Text(tourName,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 64.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(children: <Widget>[
                          Text(visitTime(),
                              style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          Text('recommended time',
                              style: GoogleFonts.quicksand(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0)),
                        ]),
                        SizedBox(
                          height: 15.0,
                        ),
                        Expanded(
                            child: CustomeCard(
                          name: places[0][currentPlaceIndex],
                          rating: double.parse(places[2][currentPlaceIndex]),
                          bottomPadding: 100.0,
                          imageLink: places[1][currentPlaceIndex],
                        )),
                        Text(distance.toStringAsFixed(2) + ' Km',
                            style: GoogleFonts.quicksand(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundedButton(
                                minWidth: 150.0,
                                title: 'Go',
                                color: Color(0xFF4E72E3),
                                onPressed: () {
                                  Future<LatLng> _locationData = getLocation();
                                  _locationData.then((value) {
                                    if (value.latitude != 0.0 &&
                                        value.longitude != 0.0) {
                                      try {
                                        print(places);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MapScreen(
                                                    destinationLat:
                                                        double.parse(places[4][
                                                            currentPlaceIndex]),
                                                    destinationLng:
                                                        double.parse(places[5][
                                                            currentPlaceIndex]),
                                                    locationLat: value.latitude,
                                                    locationLng:
                                                        value.longitude)));
                                      } catch (e) {
                                        print(e);
                                      }
                                    }
                                  });
                                }),
                            RoundedButton(
                                minWidth: 150.0,
                                title: 'Next',
                                color: Color(0xFFFFFFFF),
                                borderColor: Color(0xFF4E72E3),
                                textColor: Color(0xFF4E72E3),
                                onPressed: () {
                                  currentPlaceCnt += 1;
                                  setState(() {
                                    if (currentPlaceCnt <
                                        places[0].length - 1) {
                                      currentPlaceIndex += 1;
                                      getMiles(places[4][currentPlaceIndex],
                                          places[5][currentPlaceIndex]);
                                    }
                                  });
                                })
                          ],
                        ),
                      ],
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
