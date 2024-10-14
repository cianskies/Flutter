import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_bloc/blocs/blocs.dart';

class CurrentLocationButton extends StatelessWidget {
  const CurrentLocationButton({super.key});

  @override
  Widget build(BuildContext context) {

    final locationBloc = BlocProvider.of<LocationBloc>( context );
    final mapBloc = BlocProvider.of<MapBloc>( context );

    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          onPressed: (){
            
            final userLocatin = locationBloc.state.lastKnownPosition;
            if( userLocatin == null ) return;
            mapBloc.moveCamera( userLocatin );


          }, 
          icon: Icon( Icons.my_location_outlined, ),
        ),
      ),
    );
  }
}