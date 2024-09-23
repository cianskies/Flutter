import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Column(
        children: [
          const ListTile(
            leading: Icon( Icons.photo_album_outlined ),
            title: Text( 'Titulo' ),
            subtitle: Text('dsfsdff'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){},
                 child: const Text('Cancelar')),
                  TextButton(
                  onPressed: (){},
                 child: const Text('Ok')),
              ],
            ),
          ),
        ],
      )
    );
  }
}