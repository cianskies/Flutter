import 'package:flutter/material.dart';
import 'package:user_prefferences/preferences/preferences.dart';
import 'package:user_prefferences/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  
  static const String routerName= 'home';

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Home', ),
        backgroundColor: Colors.amber,
      ),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( 'DarkMode: ${Preferences.isDarkMode}' ),
          Divider(),
          Text( 'Gender: ${Preferences.gender}' ),
          Divider(),
          Text( 'Username: ${Preferences.name} ' ),
        ],
      )
    );
  }
}