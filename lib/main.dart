import 'package:flutter/material.dart';
// import 'package:touri/screens/adjust_time.dart';
import 'package:touri/screens/login.dart';
import 'package:touri/screens/registeration.dart';
// import 'screens/splash.dart';
import 'package:touri/screens/home.dart';
// import 'package:touri/screens/splash.dart';
import 'package:touri/screens/tour_name.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:touri/screens/add_places.dart';
// import 'package:touri/screens/tour.dart';
// import 'package:touri/screens/addData.dart';
import 'package:touri/screens/tours.dart';
import 'services/maps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TourName(),
        'login': (context) => Login(),
        'registeration': (context) => Registeration(),
        'home': (context) => Home(),
        'createTour': (context) => TourName(),
        'tours': (context) => Tours(),
      },
    );
  }
}
