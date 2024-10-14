import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  const AuthBackground({
    super.key, 
    required this.child
    });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          const _PurpleBox(),
          const _HeaderIcon(),
          this.child,
          
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon( Icons.person_pin, color: Colors.white, size: 100, ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {

  const _PurpleBox({super.key});

  @override
  Widget build(BuildContext context) {

      final size = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: size * 0.4,
      decoration: _purpleBackgroundGradient(),
      child: const Stack(
        children: [
          Positioned(top: 90, left: 30,child: _Bubble(),),
          Positioned(top: 200, left: 400,child: _Bubble(),),
          Positioned(top: 190, left: 150,child: _Bubble(),),
          Positioned(top: 300, left: 300,child: _Bubble(),),
          Positioned(top: 45, left: 300,child: _Bubble(),),
          Positioned(top: 300, left: 50,child: _Bubble(),),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackgroundGradient() {
    return const BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 80, 178, 1),
        ]
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}