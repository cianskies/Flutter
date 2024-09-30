import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      //backgroundColor: Colors.indigo,
      child: Icon(Icons.filter_center_focus, color: Colors.white,),

    );
  }
}