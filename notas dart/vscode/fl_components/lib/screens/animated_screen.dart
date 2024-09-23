import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width=300;
  double _height=300;
  Color _color= Colors.indigo;
  BorderRadiusGeometry _borderRadius= BorderRadius.circular(60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Animated container'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.bounceIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius, 
            ), duration: const Duration( milliseconds: 400),
        ),  
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: const Icon( Icons.play_arrow ),
        ),


    );
  }
  void changeShape(){
    final random = Random();
      _width=random.nextInt(600).toDouble()+50;
      _height=random.nextInt(600).toDouble()+50;
      _color= Color.fromRGBO(random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1);
      
      setState(() {});
    
  }
}