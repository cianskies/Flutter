import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Platform.isAndroid 
            ? displayDialogAndroid( context )
            : displayDialogIOS( context ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, shape: const StadiumBorder()),
          child: const Text(
            'Mostrar Alerta',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () => displayDialogAndroid(context)),
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Alerta'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Este es el mensaje de alerta'),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK')),
                  const TextButton(onPressed: null, child: Text('Cancelar')),
                ],
              )
            ],
          );
        });
  }

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Hola'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK')),
              const TextButton(
                onPressed: null,
                child: Text('Cancelar')),
            ],
          );
        });
  }
}
