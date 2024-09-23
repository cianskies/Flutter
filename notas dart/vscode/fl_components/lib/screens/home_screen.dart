import 'package:fl_components/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Componentes de Flutter' ),
        backgroundColor: Colors.amber,
      ),
      body: ListView.separated(itemBuilder: (context, index) =>  ListTile(
        leading: Icon( AppRoutes.menuOptions[index].icon ),
        title: Text( AppRoutes.menuOptions[index].name ),
        onTap: () {
          //final route= MaterialPageRoute(
          //   builder: (context) => const ListView1Screen()
          //   );
          // Navigator.push(context, route);
          Navigator.pushNamed(context, AppRoutes.menuOptions[index].route);
          
        },
      ),
       separatorBuilder: (_, __) => const Divider(),
        itemCount: AppRoutes.menuOptions.length),
    );
  }
}