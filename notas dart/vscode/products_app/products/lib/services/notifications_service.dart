import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();


  static showSnackbar( String msg ){

    final snackBar = SnackBar(
      content: Text( msg, style: const TextStyle( color: Colors.white, fontSize: 20 ), )
    );

    messengerKey.currentState!.showSnackBar(snackBar);

  }

}