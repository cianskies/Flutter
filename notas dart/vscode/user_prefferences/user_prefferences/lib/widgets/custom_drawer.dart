import 'package:flutter/material.dart';
import 'package:user_prefferences/screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          const _DrawerHeader(),

          ListTile(
            leading: const Icon( Icons.pages_outlined ),
            title: const Text( 'Home' ),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),
          ListTile(
            leading: const Icon( Icons.person ),
            title: const Text( 'People' ),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: const Icon( Icons.settings ),
            title: const Text( 'Settings' ),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsScreen.routerName);
            },
          ),

        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
          color: Colors.amber,
        )
      );
  }
}