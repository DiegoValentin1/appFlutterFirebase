import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapComponent extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapComponent({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<MapComponent> createState() => MapComponentState();
}

class MapComponentState extends State<MapComponent> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  CameraPosition? _initialPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    print(widget.longitude);
    print(widget.latitude);
    // Configura la posición inicial usando los valores recibidos como props
    _initialPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 14.4746,
    );
    _markers.add(Marker(
      markerId: const MarkerId("83"),
      position: LatLng(widget.latitude, widget.longitude),
      infoWindow: const InfoWindow(title: "Nada"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initialPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _initialPosition!,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            ),
    );
  }
}
