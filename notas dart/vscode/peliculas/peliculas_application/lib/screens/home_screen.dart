import 'package:flutter/material.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Peliculas en cines' ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.search)),
          )
        ],
      ),
      body: const Column(
        children:[
          CardSwiper(),
        ] 
      ),
    );
  }
}