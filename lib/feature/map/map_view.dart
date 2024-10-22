// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(48.85341, 2.2945),
    zoom: 15.4746,
  );

  static const CameraPosition kEiffelTower = CameraPosition(
    bearing: 0,
    target: LatLng(48.8584, 2.2945),
    tilt: 40,
    zoom: 17,
  );

  LatLng? _currentPosition;
  double _currentZoom = 15.0; // Başlangıç zoom değeri

  Future<void> _goToTheEiffelTower() async {
    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(kEiffelTower));
  }

  Future<void> _determinePosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location services are disabled.')),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied.')),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Location permissions are permanently denied.')),
        );
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });

      final GoogleMapController controller = await _controller.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentPosition!,
          zoom: 17,
        ),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  // Yakınlaştırma işlemi
  Future<void> _zoomIn() async {
    final GoogleMapController controller = await _controller.future;
    setState(() {
      _currentZoom += 1; // Zoom seviyesini artır
    });
    controller.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  // Uzaklaştırma işlemi
  Future<void> _zoomOut() async {
    final GoogleMapController controller = await _controller.future;
    setState(() {
      _currentZoom -= 1; // Zoom seviyesini azalt
    });
    controller.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _currentPosition != null
                ? {
                    Marker(
                      markerId: const MarkerId('currentLocation'),
                      position: _currentPosition!,
                    )
                  }
                : {},
          ),
          Positioned(
            top: 50,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'currentLocation',
                  onPressed: _determinePosition,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.location_on_outlined),
                ),
                const SizedBox(width: 10),
                FloatingActionButton.extended(
                  heroTag: 'eiffelTower',
                  onPressed: _goToTheEiffelTower,
                  label: const Text('Go to the Medical Clinic'),
                  icon: const Icon(Icons.tour),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 50),
              ],
            ),
          ),
          // Yakınlaştırma ve uzaklaştırma butonları
          Positioned(
            bottom: 70,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'zoomIn',
                  onPressed: _zoomIn,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.zoom_in),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'asd',
                  onPressed: _zoomOut,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
