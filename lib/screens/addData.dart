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
        'Cilantro Aswa',
        'CafÃ© and restaurant on the roo',
        'Rich Caf',
        "Pharaoh's coffe",
        'Grand Restaurant & Caf',
        'Cafe Aswan Moo',
        'Aroma Caf',
        'Abu Othman coffee sho',
        'Bob Marley Moonlight terrace &restaurant caf',
        'Ashr',
        'Sandbad Caf',
        'Afandina Caff',
        'Elephantine Caf',
        'Ashry Tok',
        'Nubian cafe Wasat El Daer',
        'Estkana Cafe',
        "Sultan's Harem Caf",
        'Dahab Caf',
        'SMiLe Caf'
      ];
      var desc = [
        'Nice elegant cafe, nice drinks and sweets, and nice seating in places overlooking the Nile in great privacy.  The place I liked very much. The prices are nice, a quiet and comfortable plac',
        'It is a pleasant cafe. It is located on the roof. The last floor has a special character. You can see Aswan From above overlooking the Nile. The drinks and food are very sweet and their prices are cheap. The place has Kids Aria and all the tables have chairs and swings for those who want To sit on it. The place has heating and an elevaTor',
        'Very quiet place, excellent servic',
        'Good View over the Nil',
        'Comfortable place in the seat, clean and the treatment is very sweet and very tasteful',
        'It is one of the luxurious places for Tourism as it overlooks the Nile',
        'It is one of the luxurious places for Tourism as it overlooks the Nile and the green areas on the other side of the Nile',
        'Very quiet place, excellent servic',
        'The view is beautiful, the atmosphere on Elephantine Island is wonderful, the service is good, and it is really an interesting experienc',
        'Very quiet place, excellent servic',
        'A reasonable place with a modern fee',
        'Very quiet place, excellent servic',
        'Good place and wonderful vie',
        'The atmosphere in Nubia is wonderful and the food is very specia',
        'The best place To relax, cool off and have the best Aswani coffee made in front of you',
        'Clean place, sweet service and reasonable prices for everyon',
        'It is one of the luxurious places for Tourism as it overlooks the Nile and the green areas on the other side of the Nile',
        'Very quiet place, excellent servic',
        'Very excellent, quiet place and a pure sweet Locatio'
      ];
      var froms = [
        '9 AM',
        '12 PM',
        '10 AM',
        '24  ',
        '12 PM',
        '10 AM',
        '24',
        '24',
        '8 AM',
        '9 AM',
        '24',
        '10 AM',
        '10 AM',
        '7.30 AM',
        '9 AM',
        '9 AM',
        '8 AM',
        '6 AM',
        '24'
      ];
      var tos = [
        '9 AM',
        '12 PM',
        '10 AM',
        '24  ',
        '12 PM',
        '10 AM',
        '24',
        '24',
        '8 AM',
        '9 AM',
        '24',
        '10 AM',
        '10 AM',
        '7.30 AM',
        '9 AM',
        '9 AM',
        '8 AM',
        '6 AM',
        '24'
      ];
      var images = [
        'https://lh5.googleusercontent.com/p/AF1QipNS9Z8uKz_aiFjY2Iwmx2cL2L1sN1xguc7YPJ7v=w408-h282-k-no',
        'https://maps.gstatic.com/tactile/pane/default_geocode-2x.png',
        'https://lh5.googleusercontent.com/p/AF1QipO_R0ADvFOi2W2n6mjJAuqiQ_OxwjXHqfVLNmL-=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipMDrsbp3piXRkbkw-8PTDrFWD_reze5R-UIQNnT=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipN777phgmoxO8ObFCSIxTkgC6aO90Ayx8Q0MYcU=w408-h530-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPhzzxlhaO-CH6K7QjVf29kI5sMXKycTENfSEr-=w426-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOukXh-SyMB94-m8LFSS-3XlsfagDz2dV2zlFJ6=w408-h244-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPiyvEdSoo_YjhspGinZM2RHfN49BwQWNezUGTl=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOWpcQilChGQO1mhWdzDUQyRV8_1N7QA8UgnbFR=w408-h306-k-no',
        'https://maps.gstatic.com/tactile/pane/default_geocode-2x.png',
        'https://lh5.googleusercontent.com/p/AF1QipOJWCSukIK-MJvTmctMAz9TavDXKjJAD05fjti5=w426-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipNSY2x8d5QOsqnKx8Dgl5lShYAfUxWD8BN7YQE2=w408-h882-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOLDx06SZNSpqETFaWYsleJ--QhGZVXcM85qAOz=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipNFP26LPEhGaabelBj-vJ15Omjes_4k_pdRHQfu=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipMDR_6Lp5Q-xv6Ah-JOaOsETqu4GBuCUwEvHleE=w426-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipP9PkHXw3IL2IpjHzlH_R41FgKdU5rb665gvNRQ=w408-h544-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipNB8cv4Ezeu2McifKZg5-8qolQ4jkO1OoiGbEi9=w408-h544-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipO28kA-FIDA6vgZ78mQgrY_LatBVysmdXmMGyqU=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipMko0TzQQHsKi_6LZ7ZGJ0_klQ8RmRruPoyT7S9=w408-h244-k-no'
      ];
      var locations = [
        'https://g.page/Cilantro-Aswan?share',
        'https://goo.gl/maps/RVT1uyt4C1hyYTeR9',
        'https://goo.gl/maps/dKhDgcBV78hZW7Tu8',
        'https://goo.gl/maps/imSqnMxLf5X1nmsN8',
        'https://g.page/grand-restaurant-cafe-912?share',
        'https://goo.gl/maps/VrESXnr5n7fCMLbZ9',
        'https://goo.gl/maps/MhLN3JSDMLyRQYnk9',
        'https://goo.gl/maps/J49YYknKuPhPPpgCA',
        'https://g.page/Alijamaica?share',
        'https://goo.gl/maps/rMqBDpGKkvvnsRrz7',
        'https://goo.gl/maps/1jTUg7vWfaupLCsk8',
        'https://goo.gl/maps/PUr36CVtYkeMa9tT6',
        'https://goo.gl/maps/97E3SBAxgHM5Wkyn9',
        'https://goo.gl/maps/NJHpWSKGAMVGCsFM6',
        'https://goo.gl/maps/61KgigcbFZS5f5bJ9',
        'https://goo.gl/maps/qTdRrHewhmZ23RJR7',
        'https://goo.gl/maps/me4LSLC4DZPeY5e28',
        'https://goo.gl/maps/i27My366Bm9XUw1H6',
        'https://goo.gl/maps/3XB9sjvFLB8Eky9V6'
      ];
      var rates = [
        '4.3',
        '5.0',
        '4.0',
        '4.0',
        '3.9',
        '3.2',
        '4.0',
        '4.2',
        '4.5',
        '5.0',
        '3.9',
        '5.0',
        '4.7',
        '4.1',
        '5.0',
        '4.2',
        '4.4',
        '5.0',
        '5.0'
      ];
      var lats = [
        '24.097717305589054',
        '24.09146127540197',
        '24.091459320060498',
        '24.07667026075623',
        '24.10317669874681',
        '24.092126144330567',
        '24.127098229341584',
        '24.094653969876212',
        '24.09073292669805',
        '24.097898445275785',
        '24.098366598684898',
        '24.090872182786264',
        '24.09878378411412',
        '24.09274873050601',
        '24.06292158738848',
        '24.104294981208557',
        '24.267497941533428',
        '24.096785287164035',
        '24.125011074389302'
      ];
      var lngs = [
        '32.89848546020532',
        '32.895224793896325',
        '32.89496726136788',
        '32.884972815896376',
        '32.901198546712266',
        '32.894492583730525',
        '32.89520786136788',
        '32.89856910018655',
        '32.89102690253409',
        '32.89914902273575',
        '32.899578176155444',
        '32.89546198594814',
        '32.8982943985181',
        '32.891256266538804',
        '32.86404981774088',
        '32.90339923955438',
        '32.911895481820835',
        '32.89920407301295',
        '32.89528252079469'
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
                'Lat': double.parse( lats[i]),
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
