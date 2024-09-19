import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {

  final options= const[ 'Final Fantasy', 'Pokemon', 'Yakuza', 'Kingdom Hearts' ];
   
  const ListView2Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'ListView tipo 1' ),
        backgroundColor: Colors.red,
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text( options[index] ),
          trailing: const Icon(Icons.forward),
          onTap: () {
            tapButton(index);
          },
        ),

         separatorBuilder: (_, __) => const Divider(),

          )
    );
  }

  void tapButton(int index){
    print( options[index] );
  }
}