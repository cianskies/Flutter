import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_prefferences/preferences/preferences.dart';
import 'package:user_prefferences/providers/theme_provider.dart';
import 'package:user_prefferences/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
   
  static const String routerName= 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
    
  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Settings', ),
        backgroundColor: Colors.amber,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text( 'Settings', 
              style: TextStyle( fontSize: 45, fontWeight: FontWeight.w300 ), 
              )
            ),

            const Divider(),

            SwitchListTile.adaptive(
              title: const Text( 'Darkmode' ),
              value: Preferences.isDarkMode, 
              onChanged: ( value ) {
                Preferences.isDarkMode = value;

                final themeProvider= Provider.of<ThemeProvider>( context, listen: false );
                value 
                ? themeProvider.setDarkMode() 
                : themeProvider.setLightMode();

                setState(() {});
              },
            ),
            
            const Divider(),

            RadioListTile<int>.adaptive(
              title: const Text( 'Masculino' ),
              value: 1, 
              groupValue: Preferences.gender, 
              onChanged: ( value ){
                Preferences.gender = value ?? 1;
                setState(() {});
              }
            ),
            RadioListTile<int>.adaptive(
              title: const Text( 'Femenino' ),
              value: 2, 
              groupValue: Preferences.gender, 
              onChanged: ( value ){
                Preferences.gender = value ?? 2;
                setState(() {});
              }
            ),

            const Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                onChanged: (value) {
                  Preferences.name = value;
                  setState(() {});
                },
                initialValue: Preferences.name,
                autofocus: false,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de Usuario',
                ),
              ),
            )
            
          ],
        ),
      ),
      
    );
  }
}