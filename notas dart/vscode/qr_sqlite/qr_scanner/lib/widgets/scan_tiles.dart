import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  
  final String tipo; 

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>( context, listen: true );
  var scans = scanListProvider.scans;
  return ListView.builder(
    itemCount: scans.length,
    itemBuilder: ( _, index ) => Dismissible(
      key: UniqueKey(),
      background: Container( color: Colors.red,),
      onDismissed: (direction) => Provider.of<ScanListProvider>( context, listen: false ).deleteScanByd(scans[index].id!),
      child: ListTile(
        leading: Icon(
          this.tipo == 'http'
          ?Icons.map
          : Icons.home, 
          color: Theme.of( context ).primaryColor 
        ),
        title: Text( scans[index].valor ),
        subtitle: Text( scans[index].id.toString()),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey, ),
        onTap: () {
          launchURL(scans[index], context);
        },
      ),
    )
    
    );
  }
}