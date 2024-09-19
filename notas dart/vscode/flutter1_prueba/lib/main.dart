import 'package:flutter/material.dart';
import 'package:flutter1_prueba/screens/counter_screen.dart';

void main(){
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget{
  const MyApp({ super.key });

  
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home:  CounterScreen(),

      
    );
  }


}
