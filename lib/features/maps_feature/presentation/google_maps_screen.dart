import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../app/utils/app_colors.dart';
import '../../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../../main.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key,});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(
          target: LatLng(29.979562,31.255448),
          zoom: 12,
        ),
        onMapCreated: (con) {
          controller = con;
          initStyle(context);
        },
        markers: {
          Marker(
            markerId: const MarkerId("1"),
            position: LatLng(29.979562,31.255448),
          ),
          Marker(
            markerId: const MarkerId("2"),
            position: LatLng(29.967936,31.248996),
          ),
          Marker(
            markerId: const MarkerId("3"),
            position: LatLng(29.990389,31.230616
            ),
          ),
          Marker(
            markerId: const MarkerId("4"),
            position: LatLng(30.011053,31.266346),
          ),
        },
      ),
    );
  }
  void initStyle(context)async {
    var style = await DefaultAssetBundle.of(context).
    loadString("assets/maps_styles/style.json");
    controller.setMapStyle(style);
  }
}

