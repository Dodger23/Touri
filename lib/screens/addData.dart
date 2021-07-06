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
        'Faryal Garden',
        'alsalam Garden',
        'Durrat El-Nile Garden',
        'Saluja and Gazelle Reserve',
        'Sheraton Garden',
        'botanical garden',
        'Aswan Tourist Walk',
        'rose garden',
        'tourist market',
        'Gharb Sohail',
        'Aswan High Dam',
        'The symbol of Egyptian friendship and the Soviet Union'
      ];
      var desc = [
        'The advantage of Faryal Park is that from within it anyone can watch the sunset until it sinks into the Nile, which is the pleasure of every tourist visiting Aswan, as it includes granite terraces overlooking the most beautiful part of the Nile with its dazzling blue, and the design of the garden is unparalleled.',
        'it has decorative columns, pergolas and floors, in addition to green areas and ornamental trees, along with lighting, paving and paints in a harmonious shape and colors to give an aesthetic and heritage touch.',
        'Establishment of water and dancing fountains, gates, decorative columns, pergolas and floors,  in addition to green areas, ornamental trees and car parks, along with lighting, paving and paints, in a coordinated form and colors to give an aesthetic and heritage touch, whether for the tourist market or the station square,',
        'The area of Salouga and Ghazal is 55 acres, so it is one of the smallest nature reserves in Egypt. The reserve is located approximately 3 km north of the Aswan Reservoir. Those islands were declared a nature reserve by Presidential Decree No. 928 of 1986, indicating that they are characterized by a special charm. With its beautiful landscapes that capture the hearts of its visitors',
        'It has decorative columns, pergolas and floors, in addition to green areas and ornamental trees, along with lighting, paving and paints in a harmonious shape and colors to give an aesthetic and heritage touch.',
        'The botanical garden includes about 695 different plant species from all over the world, and the number of plant species in the garden has been increased after their numbers in 2011 reached about 400 species only. During the past years, these species were increased to 655 species in order to rejuvenate the garden by multiplying new plants.',
        'TA tourist walkway and a Nile garden with a length of 6 km, and it has a direct frontage on the Nile Corniche, tourist bazaars, shops, cafes, green areas, tourist marinas, childrenâ€™s play areas, pedestrian movement paths, wooden pergolas, and parking spaces to serve all Aswan residents,',
        'rose garden',
        'One of the most famous markets in the Egyptian city of Aswan. The tourist street market is famous for the presence of many stalls, shops and stalls that sell the best local Egyptian watches of high quality at reasonable and reasonable prices, where you will find spices and spices, fresh herbs, and beautiful traditional clothes, in addition to oil shops. And perfumes, and if you are looking for souvenirs, this market is the right place for you. It also includes shops selling delicious Egyptian and oriental sweets, and fresh honey stores. The market includes popular cafes that provide drinks, food and shisha.',
        'Gharb Sohail" is one of thousands of Egyptian villages, but it managed to become the talk of local and international tourism, after its residents of the Nuba people took advantage of the natural, environmental and geographical elements of the village to be a destination for tourists from different countries of the world and a distinctive and indispensable tourist destination during a visit to the city of Aswan.',
        'Aswan High Dam',
        'The symbol of friendship is in the form of an open lotus flower consisting of 5 leaves. It was implemented by the Egyptian Company for Reinforced Cement. The lotus flower was chosen for its sanctity among the ancient Egyptians. again.'
      ];
      var froms = [
        '10 AM',
        '12 AM',
        '12 AM',
        '12 AM',
        '12 AM',
        '7 AM',
        '12 AM',
        '12 AM',
        '12 AM',
        '6 AM',
        '8:30 AM'
      ];
      var tos = [
        '7 PM',
        '12 PM',
        '12 PM',
        '12 PM',
        '12 PM',
        '5 PM',
        '12 PM',
        '12 PM',
        '12 PM',
        '10 PM',
        '5 PM',
        '12 Am'
      ];
      var images = [
        'https://lh5.googleusercontent.com/p/AF1QipMe19tZpUo8zIR4KKh2PbmYlknIw9Lv-oVtbRo=w408-h272-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipMloWyQ3C1bVxNZjHYGZRg15gFosJC9DCSR1Zpa=w426-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipP5XTBsDwhebPLWPlm5sQVqYd71jSIWy35e_p5b=w426-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOuT2_4heu7jzUA91M0zw9CTW5g_b9S_HTBeEMW=w408-h260-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipNCwXuziOC_TuZ8WqHe6VaU4aJjy7VxT3U5lhjM=w426-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOeAk8b04o7h6X-M2SpycjVEPCcMLZih4moKsGE=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipNiC-Bve7xI7GDmbkVcuQfFO_E23YmN34A2MDxn=w427-h240-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipOD1TaBW79CtpuM2EDI7eHDhLBnapzSCQl2cSB7=w408-h306-k-no',
        'https://img.youm7.com/ArticleImgs/2020/7/17/1486348-%D8%AA%D8%B5%D9%88%D8%B1-%D9%84%D8%B9%D9%85%D9%84%D9%8A%D8%A9-%D8%AA%D8%B7%D9%88%D9%8A%D8%B1-%D9%88%D8%A7%D8%AC%D9%87%D8%A9-%D9%85%D8%AF%D9%8A%D9%86%D8%A9-%D8%A3%D8%B3%D9%88%D8%A7%D9%86-(3).png',
        'https://lh5.googleusercontent.com/p/AF1QipNy2J_m2sXeawrrGPQVNYvfpYV4RpAh12035ZKS=w408-h244-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipPqRb1f-DFPgCliGWr1W5L-gXNCmCeaWp6jULeb=w408-h306-k-no',
        'https://lh5.googleusercontent.com/p/AF1QipM13_6XMCxA93gLi7gpmPtfyWWJHN8WqqbWMMbQ=w408-h305-k-no'
      ];
      var locations = [
        'https://bit.ly/2rbXeMC',
        'https://bit.ly/2HFdSP1',
        'https://bit.ly/2JJdQSN',
        'https://bit.ly/2rcexMz',
        'https://bit.ly/2rcBMXC',
        'https://bit.ly/2HBeftI',
        'https://www.google.com/maps/place/%D9%85%D9%85%D8%B4%D9%89+%D8%A7%D8%B3%D9%88%D8%A7%D9%86+%D8%A7%D9%84%D8%B3%D9%8A%D8%A7%D8%AD%D9%89%E2%80%AD/@24.1021557,32.9025986,17z/data=!3m1!4b1!4m9!1m2!2m1!1z2K3Yr9in2KbZgiDZgdmKINin2LPZiNin2YY!3m5!1s0x14367b55f5a62c0d:0xab8934283482fdcc!8m2!3d24.1021557!4d32.9004099!15sChrYrdiv2KfYptmCINmB2Yog2KfYs9mI2KfZhpIBCnN0YXRlX3Bhcms',
        'https://bit.ly/2JE6lfQ',
        'https://www.google.com/maps/place/%D8%A7%D9%84%D8%B3%D9%88%D9%82+%D8%A7%D9%84%D8%B3%D9%8A%D8%A7%D8%AD%D9%8A%E2%80%AD/@24.0997664,32.9107331,15z/data=!4m9!1m2!2m1!1z2KjYp9iy2KfYsdiqINmB2Yog2KfYs9mI2KfZhg!3m5!1s0x14367b2e7d9a1ce3:0x6c98b46b945318ff!8m2!3d24.0997664!4d32.9019784!15sChrYqNin2LLYp9ixINmB2Yog2KfYs9mI2KfZhpIBD3Nob3BwaW5nX2NlbnRlcg',
        'https://www.google.com/maps/place/%D8%BA%D8%B1%D8%A8+%D8%B3%D9%87%D9%8A%D9%84%D8%8C+%D8%A7%D9%88%D9%84+%D8%A7%D8%B3%D9%88%D8%A7%D9%86%D8%8C+%D8%A3%D8%B3%D9%88%D8%A7%D9%86%E2%80%AD/@24.0511097,32.859085,17z/data=!4m5!3m4!1s0x14366305f4640813:0x9d2b733758e9d746!8m2!3d24.0511097!4d32.859085',
        'https://www.google.com/maps/place/%D8%B3%D8%AF+%D8%A3%D8%B3%D9%88%D8%A7%D9%86+%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%8A%E2%80%AD/@23.9730671,32.8924413,15z/data=!4m12!1m6!3m5!1s0x1436886a6b928b8b:0x1f30b4b0578be44c!2z2LPYryDYo9iz2YjYp9mGINin2YTYudin2YTZig!8m2!3d23.970883!4d32.8772699!3m4!1s0x1436886a6b928b8b:0x1f30b4b0578be44c!8m2!3d23.970883!4d32.8772699',
        'https://www.google.com/maps/place/%D8%B1%D9%85%D8%B2+%D8%A7%D9%84%D8%B5%D8%AF%D8%A7%D9%82%D8%A9+%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A%D8%A9+%D9%88%D8%A7%D9%84%D8%A7%D8%AA%D8%AD%D8%A7%D8%AF+%D8%A7%D9%84%D8%B3%D9%88%D9%81%D9%8A%D8%AA%D9%89%E2%80%AD/@23.9707848,32.8691881,17z/data=!3m1!4b1!4m5!3m4!1s0x14368845cf955555:0x90961f1e53ce59a0!8m2!3d23.9707848!4d32.8669994'
      ];
      var rates = [
        '4.6',
        '3.7',
        '4.8',
        '4.5',
        '3.9',
        '4.5',
        '4.8',
        '3.9',
        '4',
        '5',
        '4.4',
        '4.5'
      ];
      var lats = [
        '24.08362',
        '24.09986',
        '24.10211',
        '24.07008',
        '24.09441',
        '24.09397',
        '24.10233',
        '24.11260',
        '24.10051',
        '24.05145',
        '23.97166',
        '23.97056'
      ];
      var lngs = [
        '32.88876',
        '32.89963',
        '32.90042',
        '32.87520',
        '32.89599',
        '32.88689',
        '32.90037',
        '32.89936 ',
        '32.90159',
        '32.86091',
        '32.87695',
        '32.86709'
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
        places
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
            .then((value) => print("place Added"))
            .catchError((error) => print("Failed to add places: $error"));
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
        Navigator.pushNamed(context, 'createTour');
      },
      child: Text(
        "Add Places",
      ),
    );
  }
}
