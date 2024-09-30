import 'package:flutter/material.dart';
import 'package:peliculas_application/providers/movies_provider.dart';
import 'package:peliculas_application/routes/app_routes.dart';
import 'package:peliculas_application/themes/app_themes.dart';
import 'package:provider/provider.dart';


void main() => runApp(AppState());
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: ( _ ) => MoviesProvider(), lazy: false, ),
      ],
      child: const MyApp(),
      );
  }
}

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