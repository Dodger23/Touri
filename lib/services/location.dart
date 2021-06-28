// import 'package:location/location.dart';

// class LocationServices {
//   Future<LocationData> getLocation() async {
//     Location location = new Location();
//     bool _servicesEnabled;
//     PermissionStatus _premissionGranted;
//     LocationData _locationData;

//     _servicesEnabled = await location.serviceEnabled();
//     if (!_servicesEnabled) {
//       _servicesEnabled = await location.requestService();
//       if (!_servicesEnabled) {
//         throw Exception();
//       }
//     }

//     _premissionGranted = await location.hasPermission();
//     if (_premissionGranted == PermissionStatus.denied) {
//       _premissionGranted = await location.requestPermission();
//       if (_premissionGranted != PermissionStatus.granted) {
//         throw Exception();
//       }
//     }

//     _locationData = await location.getLocation();
//     return _locationData;
//   }
// }
