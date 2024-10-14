import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_bloc/blocs/blocs.dart';

class FollowUserButton extends StatelessWidget {
  const FollowUserButton({super.key});

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>( context );

    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: BlocBuilder<MapBloc, MapState>(
          builder: ( context, state ){
            return IconButton(
              onPressed: (){
                mapBloc.add( OnFollowUserEvent(followUser: !state.isFollowingUser) );
              }, 
              icon: Icon( state.isFollowingUser ? Icons.directions_run_rounded : Icons.hail_rounded )
            );
            
          },
          
        ),
      ),
    );
  }
}