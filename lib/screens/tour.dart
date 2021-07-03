import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touri/components/roundedButton.dart';
import 'package:touri/components/card.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touri/services/maps.dart';
import 'package:location/location.dart';

class Tour extends StatefulWidget {
  final String tourName;
  final List<dynamic> places;
  Tour({Key key, @required this.tourName, @required this.places})
      : super(key: key);
  @override
  _TourState createState() => _TourState(tourName: tourName, places: places);
}

class _TourState extends State<Tour> {
  String tourName;
  List places;
  _TourState({@required this.tourName, @required this.places});
  int placeIndex = 0;
  List<String> pages = ['home', 'createTour', 'tours', 'profile'];
  int currentPlaceIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      Navigator.pushNamed(context, pages[index]);
    });
  }

  Future<LatLng> getLocation() async{
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
    return LatLng(_locationData.latitude, _locationData.longitude) ; 
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
                          Text('7:00 AM',
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
                          bottomPadding: 150.0,
                          imageLink: places[1][currentPlaceIndex],
                        )),
                        Text('4.1 miles away',
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
                                    if(value.latitude != 0.0 && value.longitude !=0.0)
                                    {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MapScreen(
                                                destinationLat:
                                                    24.046200979263986,
                                                destinationLng:
                                                    32.880991098936576,
                                                locationLat: value.latitude,
                                                locationLng: value.longitude
                                              )));
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
                                  setState(() {
                                    if (currentPlaceIndex <
                                        places[0].length - 1) {
                                      print(places[0].length);
                                      currentPlaceIndex += 1;
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
