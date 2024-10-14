
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_bloc/blocs/blocs.dart';

import 'screens/screens.dart';

void main() {
  runApp( 
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GpsBloc(),
        ),
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => MapBloc( locationBloc: BlocProvider.of<LocationBloc>(context) ),
        ),
      ],
      child: const MyApp(),
  ) );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps App',
      home: Scaffold(
        body: LoadingScreen()
      ),
    );
  }
}