import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    
    final ScanModel? scan = ModalRoute.of( context )!.settings.arguments as ScanModel?;
    CameraPosition initialCameraPosition = CameraPosition(
      target: scan!.getLatLng(), 
      zoom: 14.4746,
    );
    Set<Marker> markers= Set<Marker>();
    markers.add(Marker(
      markerId: MarkerId( 'geo-location' ),
      position: scan.getLatLng()
      )
    );
    MapType mapType=MapType.normal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text( 'Ubicacion' ),
        actions: [
          IconButton(
            onPressed: () async {
               final GoogleMapController controller = await _controller.future;
               controller.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));
            }, 
            icon: Icon(Icons.location_city))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        onMapCreated: ( GoogleMapController controller ) {
          _controller.complete(controller);
        },
        mapType: mapType,
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        if(mapType == MapType.normal){
          mapType = MapType.terrain;
        }else{
          mapType = MapType.normal;
        }
        setState(() {});
      },
      child: Icon(Icons.layers),
      ),
   );
  }
}