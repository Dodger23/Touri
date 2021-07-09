import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin, min;

List<LatLng> polylineCoordinates = [];
PolylinePoints polylinePoints = PolylinePoints();

void setPolylines(
    lcoationLat, locationLng, destinationLat, destinationLng) async {
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    'AIzaSyCgUXT5tno2FnYhhvF3MrFjs_Nr8SSdyuU',
    PointLatLng(lcoationLat, locationLng),
    PointLatLng(destinationLat, destinationLng),
  );
  if (result.status == 'OK') {
    result.points.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    });
  }
}

double _coordinateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

double getDistance(double lcoationLat, double locationLng,
    double destinationLat, double destinationLng) {

  setPolylines(lcoationLat, locationLng, destinationLat, destinationLng);
  double totalDistance = 0.0;

// Calculating the total distance by adding the distance
// between small segments
  for (int i = 0; i < polylineCoordinates.length - 1; i++) {
    totalDistance += _coordinateDistance(
      polylineCoordinates[i].latitude,
      polylineCoordinates[i].longitude,
      polylineCoordinates[i + 1].latitude,
      polylineCoordinates[i + 1].longitude,
    );
  }
  polylineCoordinates = [];
  return totalDistance;
}

  // double getMinDistance(double locationLat, double locatoinLng,
  //     List<double> placesLat, List<double> placesLng) {
  //   double mn = 1000;
  //   for (int i = 0; i < placesLat.length; i++) {
  //     mn = min(
  //       mn,
  //       getDistance(locationLat, locatoinLng, placesLat[i], placesLng[i])
  //     );
  //   }
  //   return mn;
  // }
