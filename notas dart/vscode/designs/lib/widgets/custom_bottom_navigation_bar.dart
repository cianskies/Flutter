import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      backgroundColor: const Color.fromRGBO(55, 57,84, 1  ),
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined), 
          label: 'Calendario'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outline), 
          label: 'Gráfica'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle), 
          label: 'Usuarios'
        ),
      ],
    );
  }
}