import 'package:flutter/material.dart';
import 'roundedButton.dart';

class PlacesTypes extends StatefulWidget {
  @override
  _PlacesTypesState createState() => _PlacesTypesState();
}

String selected = 'Restaurants';

class _PlacesTypesState extends State<PlacesTypes> {
  var types = <Widget>[
    RoundedButton(
        title: 'Restaurants',
        color: selected == 'Restaurants' ? Colors.amber : Colors.white,
        borderColor: Colors.black,
        textColor: Colors.black,
        onPressed: () {}
    ),
    RoundedButton(
        title: 'Cafes',
        color: selected == 'Cafes' ? Colors.amber : Colors.white,
        borderColor: Colors.black,
        textColor: Colors.black,
        onPressed: () {}
        ),
    RoundedButton(
        title: 'Temples',
        color: selected == 'Temples' ? Colors.amber : Colors.white,
        borderColor: Colors.black,
        textColor: Colors.black,
        onPressed: () {}
        ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: types,
    );
  }
}
