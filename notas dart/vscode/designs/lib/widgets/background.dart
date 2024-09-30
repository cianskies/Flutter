import 'dart:math';

import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});
    final boxDecoration = const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8],          
          colors: [
            Color( 0xff2E305F ),
            Color( 0xff202333 )
            ]
          )
      );
  @override
  Widget build(BuildContext context) {
    //purple gradient
    return Stack(
      children: [
        Container(
        decoration: boxDecoration,
        ),
        const Positioned(
          top: -100,
          left: -30,
          child: PinkBox()
        ),
        const HomeBody(),

      ]
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}

class PinkBox extends StatelessWidget {
  const PinkBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi  /5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 80),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 199, 1),
              Color.fromRGBO(241, 142, 172, 1),
            ]
          ),
        ),
      ),
    );
  }
}