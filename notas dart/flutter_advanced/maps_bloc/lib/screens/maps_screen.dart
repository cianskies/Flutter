import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_bloc/blocs/blocs.dart';
import 'package:maps_bloc/views/views.dart';
import 'package:maps_bloc/widgets/follow_user_button.dart';
import 'package:maps_bloc/widgets/widgets.dart';


class MapsScreen extends StatefulWidget {

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {

  late LocationBloc locationBloc;
  @override
  void initState() {
    super.initState();
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final mapBloc = BlocProvider.of<MapBloc>( context );
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if ( state.lastKnownPosition == null ) return const Center( child: Text( 'Espere por favor' ) );
          return Stack(
            children: [
              MapView( initialPos: state.lastKnownPosition!, ),
              //TODO: imnplementar botones..
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FollowUserButton(),
          SizedBox( height: 10, ),
          CurrentLocationButton(),
        ],
      ),
   );
  }
}