import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  
  final String imageUrl;
  final String? name;
  const CustomCardType2({
    super.key,
     required this.imageUrl,
    this.name
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      child: Column(
        children: [
            FadeInImage(
            placeholder: const AssetImage( 'assets/jar-loading.gif' ),
            image: NetworkImage( imageUrl ),
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(seconds: 2),
            ),

            if( name!= null )
              Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Text( name! ),
              )
        ],
      ),
    );
  }
}