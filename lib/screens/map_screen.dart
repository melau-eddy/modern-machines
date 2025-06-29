import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Map'),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: MarkerId('machine1'),
            position: LatLng(37.7749, -122.4194),
            infoWindow: InfoWindow(title: 'Tractor A'),
          ),
        },
      ),
    );
  }
}