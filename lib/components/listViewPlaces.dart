import 'package:flutter/material.dart';
import 'package:touri/components/rating.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Place extends StatelessWidget {
  Place(
      {@required this.name,
      @required this.image,
      @required this.rate,
      @required this.onPressed,
      this.description,
      this.from,
      this.location,
      this.to});
  final String name, image, description, from, to, location;
  final double rate;
  final Function onPressed;

  Widget buildBottomSheet(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Row(
            children: [
              Expanded(child: Image(image: NetworkImage(image))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name,
                    style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                SizedBox(
                  height: 10.0,
                ),
                Rating(
                  height: 15.0,
                  width:75,
                  rating: rate 
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      child: Text(location,
                          style: GoogleFonts.quicksand(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0)),
                      onTap: () {
                        launch(location);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.watch_later_outlined),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(from + ' - ',
                        style: GoogleFonts.quicksand(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0)),
                   
                    Text(to,
                        style: GoogleFonts.quicksand(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description,
                style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showModalBottomSheet(context: context, builder: buildBottomSheet);
            },
            child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  minRadius: 30.0,
                ),
              ),
              Container(
                width: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name, style: TextStyle(fontSize: 20.0)),
                    Rating(
                      width: 15.0,
                      rating: rate,
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF4E72E3)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: RoundCheckBox(
                checkedColor: Color(0xFF4E72E3),
                onTap: onPressed,
              ),
            ),
          )
        ],
      ),
    );
  }
}
