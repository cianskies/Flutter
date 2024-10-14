import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_bloc/blocs/blocs.dart';
import 'package:maps_bloc/screens/gps_access_screen.dart';
import 'package:maps_bloc/screens/maps_screen.dart';


class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) => 
        state.isAllGranted
        ? MapsScreen()
        : GpsAccessScreen()
      )
     );
  }
}