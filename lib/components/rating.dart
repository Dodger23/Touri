import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({@required this.rating, this.width, this.height});
  final double rating, width, height;

  @override
  _RatingState createState() => _RatingState(rating: rating);
}

class _RatingState extends State<Rating> {
  _RatingState({@required this.rating, this.width, this.height});
  double rating, width, height;

  List<int> ratingValues = [];

  @override
  void initState() {
    ratingValues = getValues(rating);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.star,
              color: ratingValues[0] == 1 ? Colors.amber : Colors.grey,
            ),
            Icon(
              Icons.star,
              color: ratingValues[1] == 1 ? Colors.amber : Colors.grey,
            ),
            Icon(
              Icons.star,
              color: ratingValues[2] == 1 ? Colors.amber : Colors.grey,
            ),
            Icon(
              Icons.star,
              color: ratingValues[3] == 1 ? Colors.amber : Colors.grey,
            ),
            Icon(
              Icons.star,
              color: ratingValues[4] == 1 ? Colors.amber : Colors.grey,
            ),
          ],
        ));
  }
}

List<int> getValues(double rating) {
  List<int> ratingValues = [0, 0, 0, 0, 0];
  for (int i = 0; i < 5; i++) {
    ratingValues[i] = i + 1 <= rating ? 1 : 0;
  }
  return ratingValues;
}
