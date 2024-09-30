import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final currentIndex = 1;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.map),
          label: 'Mapa',
          ),
        BottomNavigationBarItem(
          icon: Icon( Icons.compass_calibration),
          label: 'Direcciones',
          ),
      ],

    );
  }
}