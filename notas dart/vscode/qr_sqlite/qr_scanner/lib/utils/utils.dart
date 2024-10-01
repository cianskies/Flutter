import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL( ScanModel scan, BuildContext context ) async{
  final Uri url = Uri.parse(scan.valor);

  if ( scan.tipo == 'http' ) {
    bool canLaunch = await canLaunchUrl(url);
    if ( canLaunch ) {
      await launchUrl(url);
    } else {
     throw 'Could not launch $url';
    }

  } else {
    Navigator.pushNamed(context, 'map', arguments: scan );
  }

}