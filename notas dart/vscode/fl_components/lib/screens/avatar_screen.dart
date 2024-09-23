import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Stan Lee' ),
        backgroundColor: Colors.amber,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20.0),
            child: const CircleAvatar(
              child: Text( 'SL' ),
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSd26ch-MdWqVQQQl62BnDneJFrAdAnDvm_PVFZVrenIwYKLedn'),
         )
      ),
    );
  }
}