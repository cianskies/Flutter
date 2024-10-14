import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_bloc/blocs/blocs.dart';

class MapView extends StatelessWidget {
  const MapView({required this.initialPos});

  final LatLng initialPos;

  @override
  Widget build(BuildContext context) {

    final camerPos = CameraPosition(
      target: initialPos!,
      zoom: 15
    );

    final size = MediaQuery.of( context ).size;

    final mapBloc = BlocProvider.of<MapBloc>( context );

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Listener(
        onPointerMove: (event) => mapBloc.add( OnFollowUserEvent(followUser: false) ),
        child: GoogleMap(
          initialCameraPosition: camerPos,
          compassEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (controller) => mapBloc.add( OnMapInitializedEvent(mapController: controller) ), 
          
        
        
          // TODO : Markers
          //TODO : PolyLines
          //TODO : Cuando se mueve el mapa
        ),
      ),
    );
  }
}