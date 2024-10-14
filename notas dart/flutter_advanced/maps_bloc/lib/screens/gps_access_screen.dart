import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_bloc/blocs/blocs.dart';


class GpsAccessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return state.isGpsEnabled
            ? const _AccesButton()
            : const _EnableGpsMessage();
          },
        )
        ),
   );
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gpsBloc = BlocProvider.of<GpsBloc>( context );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text( 'Debe habilitar permisos del GPS' ),
        MaterialButton(onPressed: (){
            gpsBloc.askGpsAccess();
          },
          shape: const StadiumBorder(),
          color: Colors.grey.shade800,
          child: const Text( 'Habilitar permisos', style: TextStyle( color: Colors.white ), ),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text( 'Es necesario habilitar el GPS', style: TextStyle( fontSize: 30 ), );
  }
}