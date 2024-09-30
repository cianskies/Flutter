import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(  horizontal: 20, vertical: 20 ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( 'Classify Transaction',  style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold ),),
            SizedBox(  height: 10,),
            Text( 'Classify this transaction into a particular category',  style: TextStyle( color: Colors.white, fontSize: 15) )
          ],
        ),
      ),
    );
  }
}