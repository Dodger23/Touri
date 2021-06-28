import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset('assets/images/Splash.png'),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Welcome to',
                      style: GoogleFonts.quicksand(
                          color: Colors.black, fontSize: 35.0),
                    ),
                    Text(
                      'Touri',
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 90.0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      tooltip: 'Go to home page',
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
