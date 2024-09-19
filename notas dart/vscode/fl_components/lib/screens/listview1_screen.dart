import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
   
  const ListView1Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'ListView tipo 1' ),
      ),
      body: ListView(
        children: const [
          Text( 'Hola mundo!' ),
          Text( 'Hola mundo!' ),
          Text( 'Hola mundo!' ),
          Text( 'Hola mundo!' ),
          Text( 'Hola mundo!' ),
          Text( 'Hola mundo!' ),
          Text( 'Hola mundo!' ),
        ],
      )
    );
  }
}