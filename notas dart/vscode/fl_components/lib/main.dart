
import 'package:fl_components/screens/alert_screen.dart';
import 'package:fl_components/screens/card_screen.dart';
import 'package:fl_components/screens/listview1_screen.dart';
import 'package:fl_components/screens/listview2_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const CardScreen(),
      routes: {
        'listview1' : ( BuildContext ctx ) => const ListView1Screen(),
        'listview2' : ( BuildContext ctx ) => const ListView2Screen(),
        'alertscreen' : ( BuildContext ctx ) => const AlertScreen(),
        'cardscreen' : ( BuildContext ctx ) => const CardScreen()
      },
    );
  }
}