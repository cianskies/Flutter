import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>( context, listen: false );

    return FloatingActionButton(
      onPressed: () async { 
        
        //String barcodeScanRes = await ( FlutterBarcodeScanner.scanBarcode(  '#3D8BEF', 'Cancelar', false, ScanMode.QR) );
        final barcodeScanRes = 'http://fernando-herrera.com';

        scanListProvider.newScan(barcodeScanRes);
        //scanListProvider.newScan('geo:15.33,15.66');

      },
      //backgroundColor: Colors.indigo,
      child: Icon(Icons.filter_center_focus, color: Colors.white,),

    );
  }
}