import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans =[];
  String selectedType = 'http';

  Future<ScanModel> newScan( String valor ) async {

    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(nuevoScan);
    // Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    if ( this.selectedType == nuevoScan.tipo ) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

    loadScanByType( String type ) async{

      final scans = await DBProvider.db.getScansByType( type );
      this.scans = [...?scans];
      notifyListeners();
    }
    
    deleteAllScans() async{
      await DBProvider.db.deleteAllScans();
      this.scans = [];
      notifyListeners();
    }

    deleteScanByd( int id) async{
      await DBProvider.db.deleteScan(id);
      loadScanByType( selectedType );
    }

  

}