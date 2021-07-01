import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touri/components/card.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imageList = [
    "https://wowtravelegypt.com/wp-content/uploads/2017/04/aswan-egyptgifttours.jpg",
    "https://cdn.kimkim.com/files/a/content_articles/featured_photos/f4f569d0e23b0f0fb2f28e581e682d37c8176a09/big-711e1eb7b4eaf75f7a90b35eb2c78ae2.jpg",
    "https://images0.westend61.de/0001416745pw/painted-buildings-nagaa-suhayi-gharb-nubian-village-aswan-egypt-north-africa-africa-RHPLF16053.jpg",
    "https://wowtravelegypt.com/wp-content/uploads/2017/04/aswan-egyptgifttours.jpg",
  ];

  List<String> pages = ['home', 'createTour', 'tours', 'profile'];

  void _onItemTapped(int index) {
    setState(() {
      Navigator.pushNamed(context, pages[index]);
    });
  }

  CollectionReference _restaurants =
      FirebaseFirestore.instance.collection('restaurants');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _restaurants.get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView(children: <Widget>[
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0 ,
                  enableInfiniteScroll: true, 
                  autoPlay: true,
                  viewportFraction: 1.0
                  ),
                items: [0,1,2,3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: FittedBox(
                          child: Image(image: NetworkImage(imageList[i])),
                          fit: BoxFit.cover,
                        )
                      );
                    },
                  );
                }).toList(),
              )
            ),
            SizedBox(height: 10.0),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Welcome to Aswan',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Touri can help you explore Aswan city better, now you can search places or pick them from their category and add them to your tour',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          color: Colors.grey[700], fontSize: 15.0),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Recommended places',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          width: 180.0,
                          child: CustomeCard(
                            name: 'Test',
                            rating: 4.0,  
                            topPadding: 55.0,
                            imageLink:
                                'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
                          )),
                      Container(
                          width: 180.0,
                          child: CustomeCard(
                            name: 'Test',
                            rating: 4.0,
                            topPadding: 55.0,
                            imageLink:
                                'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          width: 180.0,
                          child: CustomeCard(
                            name: 'Test',
                            rating: 4.0,
                            topPadding: 55.0,
                            imageLink:
                                'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
                          )),
                      Container(
                          width: 180.0,
                          child: CustomeCard(
                            name: 'Test',
                            rating: 4.0,
                            topPadding: 55.0,
                            imageLink:
                                'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
                          )),
                    ],
                  )
                ]),
            )
          ],
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
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'My tours',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Color(0xFFFFD600),
        onTap: _onItemTapped,
      ),
    );
  }
}
