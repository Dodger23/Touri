import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  final double destinationLat, destinationLng;
  final double locationLat, locationLng;
  MapScreen({
    Key key,
    @required this.destinationLat,
    @required this.destinationLng,
    @required this.locationLat,
    @required this.locationLng,
  });

  @override
  _MapScreenState createState() => _MapScreenState(
      destinationLat: destinationLat,
      destinationLng: destinationLng,
      locationLat: locationLat,
      locationLng: locationLng);
}

class _MapScreenState extends State<MapScreen> {
  _MapScreenState({
    @required this.destinationLat,
    @required this.destinationLng,
    @required this.locationLat,
    @required this.locationLng,
  });

  double destinationLat, destinationLng, locationLat, locationLng;

  GoogleMapController _googleMapController;
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  Marker _origin, _destination;
  @override
  void initState() {
    super.initState();
    polylinePoints = PolylinePoints();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void setPolylines() async {
    _addDestinationMarker(LatLng(destinationLat, destinationLng));
    if (locationLat != 0.0 && locationLng != 0.0) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyCgUXT5tno2FnYhhvF3MrFjs_Nr8SSdyuU',
        PointLatLng(locationLat, locationLng),
        PointLatLng(destinationLat, destinationLng),
      );
      if (result.status == 'OK') {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });

        setState(() {
          _polylines.add(Polyline(
              width: 10,
              polylineId: PolylineId('trip'),
              color: Color(0xff4E72E3),
              points: polylineCoordinates));
        });
      }
    }
  }

  void _addDestinationMarker(LatLng pos) {
    setState(() {
      _destination = Marker(
          markerId: const MarkerId('dest'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarker,
          position: pos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition:
            CameraPosition(target: LatLng(locationLat ==0.0 ? destinationLat : locationLat, locationLng ==0.0 ? destinationLng : locationLng), zoom: locationLat==0.0 ? 17: 15 ),
        onMapCreated: (controller) {
          _googleMapController = controller;
          setPolylines();
        },
        markers: {if (_destination != null) _destination},
        polylines: _polylines,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff4E72E3),
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(locationLat, locationLng), zoom: 15),
          ),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
