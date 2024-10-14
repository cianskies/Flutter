import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_bloc/blocs/blocs.dart';
import 'package:maps_bloc/themes/uber_theme.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState>{

  final LocationBloc locationBloc;

  GoogleMapController? mapController;

  MapBloc({
    required this.locationBloc
  }) : super( const MapState() ){
    on<OnMapInitializedEvent>((event, emit) {
      emit( state.copyWith( isMapInitialized: true ) );
      _onInitMap( event.mapController );
    });

    on<OnFollowUserEvent>((event, emit) {
      emit( state.copyWith( isFollowingUser: event.followUser ) );
    },);

    locationBloc.stream.listen( ( locationState ){
      if ( !state.isFollowingUser ) return;
      if( locationState.lastKnownPosition == null ) return;
      if( mapController == null ) return;

      moveCamera( locationState.lastKnownPosition! );
    });

  }

  _onInitMap( GoogleMapController mapController ){
    this.mapController = mapController;
    this.mapController!.setMapStyle( jsonEncode( uberTheme ) );

  }

  moveCamera( LatLng newLocation ){
    final cameraUpdate = CameraUpdate.newLatLng( newLocation );
    mapController!.animateCamera(cameraUpdate);
  }

}