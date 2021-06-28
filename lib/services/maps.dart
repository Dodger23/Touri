// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:touri/services/location.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _initialCamerPosition =
//       CameraPosition(target: LatLng(33.3, 36.6), zoom: 17.0);
//   LatLng currentLocation = _initialCamerPosition.target;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         initialCameraPosition: _initialCamerPosition,
//         mapType: MapType.normal,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         onCameraMove: (CameraPosition newPos) {
//           setState(() {
//             currentLocation = newPos.target;
//           });
//         },
//       ),
//     );
//   }
// }

// Future<void> _getMyLocation() async {
//   LocationData _myLocation = await LocationServices().getLocation();
// }
