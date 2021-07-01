import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:touri/services/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCamerPosition =
      CameraPosition(target: LatLng(33.3, 36.6), zoom: 17.0);
  LatLng currentLocation = _initialCamerPosition.target;

  // GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;

  // void _addMarker(LatLng pos){
  //   if (_origin == null || (_origin == null && _destination == null))
  //   {
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Origin'),
  //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: pos 
  //       );
  //     });
  //   }
  //   else
  //   {

  //   } 
  // }

  // @override
  // void dispose() {
  //   _googleMapController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCamerPosition,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        // mapType: MapType.normal,
        // onMapCreated: (_googleMapController) {
        //   _controller.complete(_googleMapController);
        //   markers: {
        //     if (_origin != null) _origin;
        //     if (_destination != null ) _destination ;
        //   };
        //   // onLongPres: _addMarker
        // },
        // onCameraMove: (CameraPosition newPos) {
        //   setState(() {
        //     currentLocation = newPos.target;
        //   });
        // },
      ),
    );
  }
}

// Future<void> _getMyLocation() async {
//   LocationData _myLocation = await LocationServices().getLocation();
// }
