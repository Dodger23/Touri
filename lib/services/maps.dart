import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCamerPosition =
      CameraPosition(target: LatLng(24.0889, 32.8998), zoom: 13.5);

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
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyCgUXT5tno2FnYhhvF3MrFjs_Nr8SSdyuU',
      PointLatLng(_locationData.latitude, _locationData.longitude),
      PointLatLng(24.080188177158064, 32.88954886739936),
    );
    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      _addOriginMarker(LatLng(_locationData.latitude, _locationData.longitude));
      _addDestinationMarker(LatLng(24.080188177158064, 32.88954886739936));

      setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: PolylineId('trip'),
            color: Color(0xff4E72E3),
            points: polylineCoordinates));
      });
    }
  }

  void _addOriginMarker(LatLng pos) {
    setState(() {
      _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarker,
          position: pos);
    });
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
      appBar: AppBar(
        title: Center(child: Text('Go to')),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCamerPosition,
        onMapCreated: (controller) {
          _googleMapController = controller;
          setPolylines();
        },
        markers: {if(_destination!=null) _destination},
        polylines: _polylines,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff4E72E3),
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCamerPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
