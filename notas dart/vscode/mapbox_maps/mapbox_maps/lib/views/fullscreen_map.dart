import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class FullscreenMap extends StatefulWidget {

  @override
  State<FullscreenMap> createState() => _FullscreenMapState();
}

class _FullscreenMapState extends State<FullscreenMap> {
  late MapboxMap mapController;

  void _onMapCreated( MapboxMap controller ){
    mapController = controller;
  }
  final Point pointCenter =  Point(coordinates: Position(-98.0, 39.5));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapWidget(  
        styleUri: 'mapbox://styles/cianskies/cm1yx7wsb00z201plh2hzgjy8',
        cameraOptions: CameraOptions(
        center: pointCenter,
        zoom: 10,
        bearing: 0,
        pitch: 0
      ),
    onMapCreated: ( controller ) => _onMapCreated,
      ),
    );
  }
}