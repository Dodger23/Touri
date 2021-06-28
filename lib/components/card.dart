import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touri/components/rating.dart';
class CustomeCard extends StatelessWidget {
  CustomeCard({
    @required this.name, 
    @required this.rating,
    @required this.imageLink,
    this.bottomPadding : 10.0, 
    this.leftPadding: 16.0 ,
    this.topPadding: 16.0
  });
  final String name, imageLink;
  final double rating, bottomPadding , leftPadding, topPadding; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
      children: <Widget>[
          ClipRRect(
          borderRadius: BorderRadius.circular(18.0),
          child: Expanded(
                      child: Image.network(imageLink)
            ),
          ),
          Padding(
            padding: new EdgeInsets.fromLTRB(leftPadding , topPadding , 0 , bottomPadding),
            child: Expanded(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text(
                      name,style: GoogleFonts.quicksand(
                                        color: Colors.white,
                                        fontSize: 23.0),
                                  textAlign: TextAlign.left,
                      ),
                      Rating(
                        width: 30,
                        height: 15,
                        rating: rating,
                      ),

                  ],
                ),
              ),
            ),
          )
      ]
),
    );
  }
}


// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
        
//         Container(
//           width: 200.0,
//           height: 140.0,
//           child: Image.asset('assets/images/index2.jpg')
//           ),

//               Text(
//               name,style: GoogleFonts.quicksand(
//                                 color: Colors.black54,
//                                 fontSize: 23.0),
//                           textAlign: TextAlign.left,
//               ),
//         GFRating(
//             size: 25.0,
//             color: Colors.amber,
//             borderColor: Colors.amber,
//             value: rating,
//           ),
        
//       ],
//     )