import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

import '../providers/scan_list_provider.dart';


class AddressesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
  return const ScanTiles(tipo: 'geo');
  }
}