import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touri/components/roundedButton.dart';
import 'package:touri/components/card.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touri/services/maps.dart';

class Tour extends StatefulWidget {
  final String tourName;
  final List places;
  Tour({Key key, @required this.tourName, @required this.places})
      : super(key: key);
  @override
  _TourState createState() => _TourState(tourName: tourName, places: places);
}

class _TourState extends State<Tour> {
  String tourName;
  List places;
  _TourState({@required this.tourName, @required this.places});
  int placeIndex = 0 ; 
  List<String> pages = ['home', 'createTour', 'myTours', 'profile'];

  void _onItemTapped(int index) {
    setState(() {
      Navigator.pushNamed(context, pages[index]);
    });
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
                        Column(
                          children: <Widget>[
                            Text('7:00 AM',
                              style: GoogleFonts.quicksand(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)
                            ),
                            Text('recommended time',
                              style: GoogleFonts.quicksand(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)
                            ),
                          ]
                        ),

                        SizedBox(height: 15.0,),

                        Expanded(
                          child: CustomeCard(
                            name: places[0], 
                            rating: 4.0, 
                            bottomPadding: 50.0, 
                            imageLink: 'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg', 
                          )
                        ),

                        Text('4.1 miles away',
                        style: GoogleFonts.quicksand(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0)
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundedButton(
                              minWidth: 150.0,
                              title: 'Go',
                              color: Color(0xFF4E72E3), 
                              onPressed: (){
                              //   Navigator.push(context, MaterialPageRoute(
                              // builder : (context) => MapScreen()));

                              }
                            ),
                            RoundedButton(
                              minWidth: 150.0,
                              title: 'Next',
                              color: Color(0xFFFFFFFF), 
                              borderColor: Color(0xFF4E72E3),
                              textColor: Color(0xFF4E72E3),
                              onPressed: (){
                                
                              }
                            )
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
