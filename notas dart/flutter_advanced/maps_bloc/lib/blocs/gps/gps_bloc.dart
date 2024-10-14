import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState>{
  

  StreamSubscription? gpsServiceSubscription;


  GpsBloc() : super( const GpsState( isGpsEnabled: false, isGpsPermissionGranted: false ) ){
    on<OnGpsAndPermissionEvent>((event, emit) =>
      emit( state.copyWith( 
        isGpsEnabled: event.isGpsEnabled, 
        isGpsPermissionGranted:  event.isGpsPermissionGranted 
      ))
    );

    _init();

  }

  Future _init() async{
    
    final gpsInitStatus = await Future.wait([
      _checkGpsStatus(),
      _checkGpsPermissionGranted()
    ]);

    add( OnGpsAndPermissionEvent(
      isGpsEnabled: gpsInitStatus[0], 
      isGpsPermissionGranted: gpsInitStatus[1]
    ));
  }

  Future<bool> _checkGpsPermissionGranted() async{
    final isGranted = Permission.location.isGranted;
    return isGranted;

  }

  Future<bool> _checkGpsStatus() async{

    final isEnabled = await Geolocator.isLocationServiceEnabled();

    Geolocator.getServiceStatusStream().listen( ( event ){
      print(  'Service status $event' );
      final isEnable =  ( event.index == 1 ) ? true : false;
      add( OnGpsAndPermissionEvent(
      isGpsEnabled: isEnable,
      isGpsPermissionGranted: state.isGpsPermissionGranted
      ));
    });

    return isEnabled;
  }

  askGpsAccess() async{
    final status = await Permission.location.request();
    
    switch( status ) {
      case PermissionStatus.granted:
        add( OnGpsAndPermissionEvent(isGpsEnabled: state.isGpsEnabled, isGpsPermissionGranted: true) );
        break;
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
      case PermissionStatus.denied:
        add( OnGpsAndPermissionEvent(isGpsEnabled: state.isGpsEnabled, isGpsPermissionGranted: false) );
        openAppSettings();
    }

  }


  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }

}