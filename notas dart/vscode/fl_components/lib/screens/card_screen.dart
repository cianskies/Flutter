import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Card Widget' ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
        children: const[
          CustomCardType1(),
          SizedBox( height: 20,),

          CustomCardType2(name: 'Las vistas de Gaia',  imageUrl: 'https://images2.alphacoders.com/134/thumb-1920-1349899.png',),
          SizedBox( height: 20,),

          CustomCardType2(name: 'Sephirot, tifa y Aeris',  imageUrl: 'https://catwithmonocle.com/wp-content/uploads/2023/12/ff7rebirth-artwork-02-1920x1080-1.jpg',),
          SizedBox( height: 20,),

          CustomCardType2(imageUrl: 'https://www.gamewallpapers.com/img_script/wallpaper_dir/img.php?src=wallpaper_final_fantasy_vii_rebirth_02_2560x1440.jpg&height=450&width=800&fill-to-fit&sharpen',),
          SizedBox( height: 20,),
        ],
      )
    );
  }
}

