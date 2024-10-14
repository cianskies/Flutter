import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key, required this.child});
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: _CreateCardShape(),
        child: this.child,
      
      ),
    );
  }
  BoxDecoration _CreateCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
        BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5)
    )
    ]
  );
}