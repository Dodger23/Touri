import 'package:flutter/material.dart';
import 'package:touri/screens/login.dart';
import 'package:touri/screens/registeration.dart';
import 'package:touri/screens/home.dart';
import 'package:touri/screens/splash.dart';
// import 'package:touri/screens/splash.dart';
import 'package:touri/screens/tour_name.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:touri/screens/add_places.dart';
// import 'package:touri/screens/tour.dart';
import 'package:touri/screens/addData.dart';
import 'package:touri/screens/tours.dart';
// import 'package:touri/services/maps.dart';
import 'screens/profile.dart';

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
        '/': (context) => Splash(),
        'splash': (context) => Splash(),
        'login': (context) => Login(),
        'registeration': (context) => Registeration(),
        'home': (context) => Home(),
        'createTour': (context) => TourName(),
        'tours': (context) => Tours(),
        'profile': (context) => Profile(),
        'addData': (context) => AddData(),
      },
    );
  }
}
