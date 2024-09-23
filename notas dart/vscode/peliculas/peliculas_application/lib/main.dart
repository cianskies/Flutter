import 'package:flutter/material.dart';
import 'package:peliculas_application/routes/app_routes.dart';
import 'package:peliculas_application/themes/app_themes.dart';

import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas App',
      initialRoute: 'home',
      routes: AppRoutes.getAppRoutes(context),
      theme: AppThemes.lightTheme,
      
    );
  }
}