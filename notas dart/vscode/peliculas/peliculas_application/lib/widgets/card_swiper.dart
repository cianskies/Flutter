import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_application/themes/app_themes.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of( context ).size;

    return Container(
      width: double.infinity,
      height: size.height*0.5,
      color: AppThemes.primary,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (_, index) => const FadeInImage(
          color: Colors.amberAccent,
          placeholder: NetworkImage( 'https://via.placeholder.com/300x400' ), 
          image: NetworkImage( 'https://via.placeholder.com/300x400' ),
          ),

        ),
    );
  }
}