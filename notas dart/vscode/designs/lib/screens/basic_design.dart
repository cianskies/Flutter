import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
   
  const BasicDesignScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
          children: [
            Image(image: AssetImage( 'assets/landscape_2.jfif' )),

            Title(),

            ButtonSection(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(  'Aliquip elit laboris sint deserunt. Id aliqua eiusmod occaecat mollit adipisicing ut sit est excepteur elit aliquip nulla. Fugiat ad exercitation magna quis ea nisi ipsum Lorem. Sunt elit incididunt ullamco duis. Amet cillum est anim ullamco Lorem.Aute occaecat ad labore aute ex duis commodo fugiat reprehenderit. Officia duis aute pariatur culpa sit. Velit commodo sunt pariatur non cupidatat.'),
            ),
          ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 30, vertical: 20 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( 'Oeschinen Lake CampGround', style: TextStyle( fontWeight: FontWeight.bold ),),
              Text( 'Kandersteg, Switzerland', style: TextStyle( color: Colors.black38), ),
            ],
          ),
          Expanded(child: Container()),
          const Icon( Icons.star, color: Colors.amber,),
          const Text( '41' ),
        ],
      ),
    );
  }
  
}
class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Expanded(child: Container()),
        ButtonSectionItem(  iconData: Icons.call, title: 'CALL',),
        ButtonSectionItem(  iconData: Icons.navigation, title: 'ROUTE',),
        ButtonSectionItem(  iconData: Icons.share, title: 'SHARE',),
        //Expanded(child: Container()),
      ],
    );
  }
}

class ButtonSectionItem extends StatelessWidget {

  final IconData iconData;
  final String title;
  const ButtonSectionItem({
    super.key, required this.iconData, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton( onPressed: () {  }, icon: Icon( iconData), color: Colors.blue, iconSize: 40,),
          Text( title, style: const TextStyle(color: Colors.blue),)
        ],
      ),
    );
  }
}
