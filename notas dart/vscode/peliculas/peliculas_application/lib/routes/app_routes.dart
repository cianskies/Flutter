import 'package:flutter/material.dart';
import 'package:peliculas_application/screens/details_screen.dart';
import 'package:peliculas_application/screens/home_screen.dart';

class AppRoutes {
  static final routes = <String, Widget> {
    'home'   : const HomeScreen(),
    'details': const DetailsScreen(),

  };
  static Map<String,  Widget Function(BuildContext)> getAppRoutes( BuildContext context ){
    Map<String,  Widget Function(BuildContext)> appRoutes={};

    for (var item in routes.entries) {
      appRoutes.addAll({ item.key : (BuildContext context ) => item.value });
    }
    return appRoutes;
  }

}