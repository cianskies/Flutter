
import 'package:flutter/material.dart';
import 'package:qr_scanner/addresses_page.dart';
import 'package:qr_scanner/pages/maps_page.dart';
import 'package:qr_scanner/widgets/custom_bottom_navigation_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Historial' ),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon( Icons.delete_forever )
            ),
        ],
      ),
      body: _HomePageBody(),

     bottomNavigationBar: const CustomBottomNavigationBar(),
     floatingActionButton: const ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = 1 ;
    switch (currentIndex){
      case 0:
      return MapsPage();

      case 1: 
      return AddressesPage();

      default: return MapsPage();
    }
  }
}