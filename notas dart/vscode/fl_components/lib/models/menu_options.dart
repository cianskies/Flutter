import 'package:flutter/material.dart';

class MenuOption {
  final String route;
  final String name;
  final IconData icon;
  final Widget screen;

  MenuOption({
    required this.name,
    required this.route,
     required this.icon,
      required this.screen
  });
}