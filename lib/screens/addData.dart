import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference restaurants =
        FirebaseFirestore.instance.collection('restaurants');
    // CollectionReference temples = FirebaseFirestore.instance.collection('temples');
    CollectionReference cafes = FirebaseFirestore.instance.collection('cafes');
    CollectionReference places =
        FirebaseFirestore.instance.collection('places');

    Future<void> addPlace() async {
      var names = [
        'Cafe LOCATION Aswan Coffee & More',
        'Afandina Caffe',
        'ONATY Nubian Cafe',
        'Bistro cafe',
        'Makani Resturant',
        'Nubian cafe',
        'Arkan Cafe',
        'Siesta',
        'Umm Kulthum cafe',
        'Sheriton Cafe',
        'The rock cafe',
        '24/7 playstaion cafe',
        'Nubian House',
        'Sandbad Cafe',
        'Momen Cafe',
        'Kimo cafe'
      ];
      var desc = [
        'I tried many places in Aswan, this is the best coffee taste here but only bar seats is availabl',
        'The most beautiful hours of calm, rest and wonderful drink',
        'Yes!!! It is my favorite spot at Aswan. Great Turkish coffee and you really should try the Nubian-Sudanese tradition coffee ...GABANA',
        'Something like that, when you enter the cafe, you feel happy about what products and how people are treated,, I am going to you to go to hi',
        'A wonderful and distinctive place and an excellent location on the most beautiful shores of the Nile River in the Arab Republic of Egyp',
        'Its our favorite place to drink our coffee in Elephantine, what a magic Nile view',
        'Great taste, great quality and excellent service.. and thank you for your hospitality and I hope to visit you many time',
        'Very nice place to enjoy excellent cold drinks after visiting the tombs of nobles. Friendly and colorful atmosphere. warm reception',
        'The cafe is good, the service is fast, and the prices are suitable for everyone. It is located in front of the Aswan train station, so it is perfectly suitable for travele',
        'I like this place very much. A place to add and bring comfor',
        'Chic.Organized.Quiet.Extremely tasteful in the choice of photovoltaic.Modern about two months ago from today.Precautionary measures are in the entrance gate.Fire extinguisher.First aid cupboard.I belong to the continuity with tim',
        'Nice place for cafe and a quick drin',
        'Nice and quiet plac',
        'Excellent very excellen',
        'Excellent very excellen',
        'Beautiful and great servic'
      ];
      var froms = [
        '7 AM',
        '7 PM',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '7 PM',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours'
      ];
      var tos = [
        '2 AM',
        '6 PM',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '7 AM',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours',
        '24 hours'
      ];
      var images = [
        'https://lh5.googleusercontent.com/p/AF1QipNpadTIdgwHTNf4e3Tv5a6kZxNB_c2uZ28CqGOv=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipNSY2x8d5QOsqnKx8Dgl5lShYAfUxWD8BN7YQE2=w408-h882-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipN8p28EzrbMqxpwmc9U60fCgWtU2fxWjgPfsQrR=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPCLdW7K5oq5S6WZvyHSkm3prziK_ZCRELKO0qZ=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPNeTUvFCV9w2Yo1hfnNWEmPbTR9MrBSUuQNKs5=w408-h544-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOh_XWDSFFXvCWn71ZRwonRN3LFz3c50qqzYlFK=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipO1TpiIpHTlm3_bCneTC1RlUqkxnoj2mWox53mC=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPqIbDZ2rt2LHDH0MOkE-TrZ7Z7joFPY8yrlxfQ=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOasRaPnImiS-MiPuONePFSfIwnJKK1N0661c5y=w408-h304-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipMgl3aw1iTHAcmWGVuohHBXd1N0WqMkEWckV3V6=w408-h544-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipNQyXpMvth69U3kwFYIGN54r8b6hda8dCDfpJOy=w426-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipNYCUFfnXSLPs2c3a3Y5sDGoA8FeBORAPaB4Sp0=w408-h255-k-no',
        'https://lh3.googleusercontent.com/proxy/WTMdE1Kk9EUomaG6EUt3Kvi65ugTn9fUUxSHJvkQ6eYhuFBnfRXZuaIYiM0_LicRl0GYUWWEY9La6g3aGl17IxcV__yBBlrccih2oVdFVfr5njxSvZbC55Rk_bjDABWDziNLE1GwE_HmaYCD05qIS1w2ewLRd7o=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOJWCSukIK-MJvTmctMAz9TavDXKjJAD05fjti5=w426-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPRol5h1M3E-SAW8U2yDJHWFObaWRUBAljET2nz=w408-h725-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipMShXklHs4w-6LBd5GoRJ3B3J_iAG9-TS7b7BQ9=w426-h240-k-no'
      ];
      var locations = [
        'https://goo.gl/maps/3wAa1oCQTifctutNA',
        'https://goo.gl/maps/VKrYBqE7x3NaDnjQA',
        'https://goo.gl/maps/gztaB4E6bMiVMwgj7',
        'https://goo.gl/maps/7vZeAtV1v3ucPhzM7',
        'https://g.page/makani-141?share',
        'https://goo.gl/maps/wV9KiRZtJcNUp9nt5',
        'https://goo.gl/maps/4ETMCv7sJQamTvUm6',
        'https://goo.gl/maps/HR1223bwrbJHLDp68',
        'https://goo.gl/maps/5RxLLeHwBi59FVJr5',
        'https://goo.gl/maps/UnuU5CghdcG6XCAU7',
        'https://goo.gl/maps/5no2f4p2kSXAoRbv7',
        'https://goo.gl/maps/jQRhC5MWuPUEgzAk6',
        'https://goo.gl/maps/DDersepSmzXtxN9r8',
        'https://goo.gl/maps/edxEY2rFEyaxacGZ8',
        'https://goo.gl/maps/rN6QeMvteoVVCogz5',
        'https://goo.gl/maps/TWFrkafw3SAe7eqa7'
      ];
      var rates = [
        '4.4',
        '5.0',
        '4.7',
        '4.5',
        '4.4',
        '5.0',
        '4.8',
        '5.0',
        '3.8',
        '5.0',
        '4.4',
        '4.4',
        '4.8',
        '3.9',
        '4.5',
        '3.1'
      ];
      var lats = [
        '24.100762640402586',
        '24.08946299561661',
        '24.0742236275273',
        '24.1142822802645',
        '24.0853201799784',
        '24.09049295524204',
        '24.091549664762805',
        '24.103438965469433',
        '24.099965282925343',
        '24.10479611271300',
        '24.127687398243765',
        '24.06757180324464',
        '24.08645887704685',
        '24.097584654110207',
        '24.104685159482553',
        '24.102804834040413'
      ];
      var lngs = [
        '32.89945228465574',
        '32.89469114682162',
        '32.88446511402486',
        '32.899143202390285',
        '32.890646058207665',
        '32.891420488900486',
        '32.89755517169766',
        '32.89196373122703',
        '32.90123344471721',
        '32.89197325648603',
        '32.894389102389944',
        '32.88555418704458',
        '32.88646650051016',
        '32.89921235841007',
        '32.898983438699375',
        '32.89761014761252'
      ];
      // restaurants
      //     .add(
      //       {
      //         'Name': 'El Dokka',
      //         'Description':
      //             'This large temple complex, relocated to the island of Agilika with the building of the High Dam in Aswan, features the magnificent Temple of Isis that was built in the late Ptolemaic and early Roman periods.',
      //         'Location': 'https://goo.gl/maps/NYPoDTWUb7CazSrR8',
      //         'Rate': 4.0,
      //         'Image':
      //             'https://www.egypttoursportal.com/images/2017/11/Aswan-Nile-Rever-Egypt-Tours-Portal.jpg',
      //         'From': '7:00 AM',
      //         'To': '6:00 PM'
      //       },
      //     )
      //     .then((value) => print("restaurant Added"))
      //     .catchError((error) => print("Failed to add place: $error"));
      for (int i = 0; i < names.length; i++) {
        cafes
            .add(
              {
                'Name': names[i],
                'Description': desc[i],
                'Location': locations[i],
                'Rate': double.parse(rates[i]),
                'Image': images[i],
                'From': froms[i],
                'To': tos[i],
                'Lat': double.parse(lats[i]),
                'Lng': double.parse(lngs[i]),
              },
            )
            .then((value) => print("cafe Added"))
            .catchError((error) => print("Failed to add place: $error"));
      }
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
      // places
      //     .add(
      //       {
      //         'Name': 'Aswan High Dam',
      //         'Description':
      //             'Supplying water and electricity to all of Egypt, this impressive two-mile dam was a 1960s feat of engineering.',
      //         'Location': 'https://goo.gl/maps/Eosi21PApj8mhh7r6',
      //         'Rate': 4.4,
      //         'Image':
      //             'https://cdn.britannica.com/34/76234-050-6176AC39/Aswan-High-Dam-Egypt.jpg',
      //         'From': '7:00 AM',
      //         'To': '2:00 PM'
      //       },
      //     )
      //     .then((value) => print("Place Added"))
      //     .catchError((error) => print("Failed to add place: $error"));
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
