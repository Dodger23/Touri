import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference restaurants = FirebaseFirestore.instance.collection('restaurants');
    // CollectionReference temples = FirebaseFirestore.instance.collection('temples');
    CollectionReference cafes = FirebaseFirestore.instance.collection('cafes');
    CollectionReference places = FirebaseFirestore.instance.collection('places');

    Future<void> addPlace() async {
      restaurants
          .add(
            {
              'Name': 'El Dokka',
              'Description':
                  'This large temple complex, relocated to the island of Agilika with the building of the High Dam in Aswan, features the magnificent Temple of Isis that was built in the late Ptolemaic and early Roman periods.',
              'Location': 'https://goo.gl/maps/NYPoDTWUb7CazSrR8',
              'Rate': 4.0,
              'Image':
                  'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
              'From': '7:00 AM',
              'To': '6:00 PM'
            },
          )
          .then((value) => print("restaurant Added"))
          .catchError((error) => print("Failed to add place: $error"));
      cafes
          .add(
            {
              'Name': 'Cilantro',
              'Description':
                  'Great view over the nile',
              'Location': 'https://g.page/Cilantro-Aswan?share',
              'Rate': 4.5,
              'Image':
                  'https://lh3.googleusercontent.com/p/AF1QipOqFDy_vW3v0S5_bsKcDh9wIn43DmsgLNNfDrmY=h400-no',
              'From': '9:00 AM',
              'To': '1:00 AM'
            },
          )
          .then((value) => print("cafe Added"))
          .catchError((error) => print("Failed to add place: $error"));
      // temples
      //     .add(
      //       {
      //         'Name': 'Temple of Philae',
      //         'Description':
      //             'This large temple complex, relocated to the island of Agilika with the building of the High Dam in Aswan, features the magnificent Temple of Isis that was built in the late Ptolemaic and early Roman periods.',
      //         'Location': 'https://goo.gl/maps/g9Pcp7LTgc9Mc9FB9',
      //         'Rate': 4.5,
      //         'Image':
      //             'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
      //         'From': '7:00 AM',
      //         'To': '6:00 PM'
      //       },
      //     )
      //     .then((value) => print("temple Added"))
      //     .catchError((error) => print("Failed to add place: $error"));
      places
          .add(
            {
              'Name': 'Aswan High Dam',
              'Description':
                  'Supplying water and electricity to all of Egypt, this impressive two-mile dam was a 1960s feat of engineering.',
              'Location': 'https://goo.gl/maps/Eosi21PApj8mhh7r6',
              'Rate': 4.4,
              'Image':
                  'https://cdn.britannica.com/34/76234-050-6176AC39/Aswan-High-Dam-Egypt.jpg',
              'From': '7:00 AM',
              'To': '2:00 PM'
            },
          )
          .then((value) => print("Place Added"))
          .catchError((error) => print("Failed to add place: $error"));
    }

    return TextButton(
      onPressed: () {
        addPlace();
        Navigator.pushNamed(context, '/createTour');
      },
      child: Text(
        "Add Places",
      ),
    );
  }
}
