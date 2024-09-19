import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter=0;

  void increase(){
    ++counter;
    setState(() {
    });
  }
  void decrease(){
    --counter;
    setState(() {
    });
  }
  void toZero(){
    counter=0;
    setState(() {
    });
  } 

  @override
  Widget build(BuildContext context) {

    const fontSize = TextStyle( fontSize: 30 );


    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Counter Screen' ),
        elevation: 10.0,
        backgroundColor: Colors.blue,
      ),

      backgroundColor: Colors.yellow,
      body:  Center(
        child:  Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            const Text( 'Numero de clics:', style: fontSize),
            Text( ' $counter ', style: fontSize ),
          ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
      floatingActionButton: CustomFloatingActions(increaseFn: increase, decreaseFn: decrease, toZero: toZero,
      )
    );
    
  }
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function toZero;
  const CustomFloatingActions({
    super.key, required this.increaseFn, required this.decreaseFn, required this.toZero,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon( Icons.plus_one ),
          onPressed: (){
        
            increaseFn();
          }
          ),
          FloatingActionButton(
          child: const Icon( Icons.exposure_zero ),
          onPressed: (){
        
            decreaseFn();

          }
          ),
          FloatingActionButton(
          child: const Icon( Icons.exposure_minus_1_outlined ),
          onPressed: (){

            toZero();
          }
          ),
    
      ],
    );
  }
}