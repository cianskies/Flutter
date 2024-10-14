import 'package:flutter/material.dart';
import 'package:mapbox_maps/views/fullscreen_map.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Pass your access token to MapboxOptions so you can load a map
  String ACCESS_TOKEN = 'sk.eyJ1IjoiY2lhbnNraWVzIiwiYSI6ImNtMXl2Z256djAwb3YycXM4NGhwZ3BiMWYifQ.6htUxefVyMDIqYK9HSe9OA';
  MapboxOptions.setAccessToken(ACCESS_TOKEN);
  // Define options for your camera

  // Run your application, passing your CameraOptions to the MapWidget
  runApp(MaterialApp(home: FullscreenMap()
  )
  );
}






