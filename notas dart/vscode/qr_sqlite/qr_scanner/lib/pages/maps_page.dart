import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';


class MapsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  return const ScanTiles(tipo: 'geo');
  }
}