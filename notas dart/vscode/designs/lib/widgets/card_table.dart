import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(iconData: Icons.apps, text: 'General', color: Colors.blue,),
            _SingleCard(iconData: Icons.safety_check, text: 'Seguridad', color: Colors.purple,),

          ],
        ),
        TableRow(
          children: [
            _SingleCard(iconData: Icons.cloud, text: 'Cloud', color: Colors.green,),
            _SingleCard(iconData: Icons.warning_amber, text: 'Avisos', color: Colors.red,),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(iconData: Icons.apps, text: 'General', color: Colors.blue,),
            _SingleCard(iconData: Icons.safety_check, text: 'Seguridad', color: Colors.purple,),

          ],
        ),
        TableRow(
          children: [
            _SingleCard(iconData: Icons.cloud, text: 'Cloud', color: Colors.green,),
            _SingleCard(iconData: Icons.warning_amber, text: 'Avisos', color: Colors.red,),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(iconData: Icons.apps, text: 'General', color: Colors.blue,),
            _SingleCard(iconData: Icons.safety_check, text: 'Seguridad', color: Colors.purple,),

          ],
        ),
        TableRow(
          children: [
            _SingleCard(iconData: Icons.cloud, text: 'Cloud', color: Colors.green,),
            _SingleCard(iconData: Icons.warning_amber, text: 'Avisos', color: Colors.red,),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final IconData iconData;
  final Color color;
  final String text;

  const _SingleCard({super.key, 
  required this.iconData, 
  required this.color, 
  required this.text
  });

  @override
  Widget build(BuildContext context) {
    var column = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 30,
                  child: Icon( iconData),
                ),
                const SizedBox(height: 10,),
                Text( text, style: TextStyle( color: color, fontSize: 18 ),)
              ],
    );
    return _CardBackGround(widget: column);
    
  }
}

class _CardBackGround extends StatelessWidget {
  final Widget widget;
  const _CardBackGround({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5
          ),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular( 20),
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}