import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {

  final options= const[ 'Final Fantasy', 'Pokemon', 'Yakuza' ];
   
  const ListView1Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'ListView tipo 1' ),
      ),
      body: ListView(
        children:  [
          ...options.map(
            (game) => 
              ListTile(
                title: Text( game ),
                trailing:  const Icon( Icons.arrow_forward_ios_outlined ),
              )
            ).toList()
        ],
      )
    );
  }
}