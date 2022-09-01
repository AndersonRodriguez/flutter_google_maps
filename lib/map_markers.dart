import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker markerVilla = Marker(
  markerId: const MarkerId('Villavicencio'),
  position: const LatLng(4.151382, -73.637688),
  infoWindow: const InfoWindow(title: 'Villavicencio'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  draggable: true,
  onDragEnd: (latLon) {
    print(latLon);
  },
  onTap: () {
    print('OnTab');
  },
);

const CameraPosition bogota = CameraPosition(
  target: LatLng(4.624335, -74.063644),
  zoom: 14,
  bearing: 45,
  tilt: 50,
);
