
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/pages/addresses_page.dart';
import 'package:qr_scanner/pages/maps_page.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/custom_bottom_navigation_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';


class HomePage extends StatelessWidget {

  final dbProvider= DBProvider.db;
  
  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>( context, listen: false );

    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Historial' ),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              scanListProvider.deleteAllScans();
            }, 
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

    final uiProvider= Provider.of<UiProvider>( context );
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO init database
    final scanListProvider = Provider.of<ScanListProvider>( context, listen: false );


    switch (currentIndex){
      case 0:
      scanListProvider.loadScanByType( 'geo' );
      scanListProvider.selectedType = 'geo';
      return MapsPage();

      case 1: 
      scanListProvider.loadScanByType( 'http' );
      scanListProvider.selectedType = 'http';
      return AddressesPage();

      default: return MapsPage();
    }
  }
}