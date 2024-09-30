import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  const ScrollScreen({super.key});
  final boxDecoration = const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [ 0.5,0.5 ],
            colors: [
            Color( 0xff5EE8C5 ),
            Color( 0xff30BAD6 ),
          ])
        );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            const Page1(),
            Container(
              color:  const Color(0xff30BAD6),
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color( 0xff0098FA ),
                    elevation: 100
                  ),
                  onPressed: () {}, 
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text( 'Bienvenido', style: TextStyle( fontSize: 30, color: Colors.white ),
                    ),
                  ),
                ),
              )
            )
          ]
        ),
      ),  
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Background(),
        MainContent(),
      ],
    );
  }
}


class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(
        image: AssetImage( 'assets/scroll-1.png' )
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle( color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50,),
          const Text( '13:45', style:  textStyle),
          const Text( 'Miercoles', style: textStyle ),
          Expanded(child: Container()),
          IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white,))    
        ],
      ),
    );
  }
}
