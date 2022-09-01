import 'package:flutter/material.dart';
import 'package:flutter_google_maps/map_markers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LatLng _location = const LatLng(4.151382, -73.637688);

  late GoogleMapController mapController;

  _myMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  gotoBogota() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(bogota));
  }

  gotoCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final CameraPosition myLocation = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 11,
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(myLocation));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps'),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _location,
            zoom: 13,
          ),
          circles: {
            Circle(
              circleId: const CircleId('Circle 1'),
              center: _location,
              radius: 100,
              strokeWidth: 3,
              fillColor: Colors.green,
              strokeColor: Colors.blue,
              visible: true,
              onTap: () {
                print('Tab Circle');
              },
            ),
          },
          polylines: {
            Polyline(
              polylineId: const PolylineId('Polyline 1'),
              points: [_location, const LatLng(4.624335, -74.063644)],
              width: 3,
              color: Colors.yellow,
            ),
          },
          markers: {markerVilla},
          onMapCreated: _myMapCreated,
          mapType: MapType.terrain,
        ),
        floatingActionButton: FloatingActionButton.extended(
          // onPressed: gotoBogota,
          onPressed: gotoCurrentLocation,
          label: const Text('Bogota'),
          icon: const Icon(Icons.home),
        ),
      ),
    );
  }
}
