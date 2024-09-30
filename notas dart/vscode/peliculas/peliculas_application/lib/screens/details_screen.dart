import 'package:flutter/material.dart';
import 'package:peliculas_application/widgets/widgets.dart';

import '../models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {


    //MODAL ROUTE OF CONTEXT- SETTINGS- ARGUMENTS => RECIBE LOS ARGUMENTS QUE HEMOS PASADO AL NAVEGAR A ESTA RUTA
    final Movie movie= ModalRoute.of( context )!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        //slivers= componentes que reaccionan al scroll
        slivers: [
          _CustomAppBar(movie: movie,),

          //sliverlist contiene una lista de widgets normales para usarlo como si fueran slivers
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              _Overview(movie: movie,),
              CastingCards(movieId: movie.id,),

          ])
          ),
        ],
      )
    );
  }
}
class _CustomAppBar extends StatelessWidget {

  final Movie movie;
  const _CustomAppBar({ 
    required this.movie
    });
  @override
  Widget build(BuildContext context) {

    //appbar que permite controlar ancho y alto
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black45,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left:10, right: 10),
            child: Text( 
                movie.title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
                ),
          ),
          ),
          background: FadeInImage(
          placeholder: const AssetImage( 'assets/loading.gif' ),
           image: NetworkImage( movie.fullBackdropPath ),
           fit: BoxFit.cover,
           ),
      ),
      
      
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;
  
  const _PosterAndTitle({ 
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

  var voteAvg= movie.voteAverage;
  final TextTheme textTheme= Theme.of(context).textTheme;
  final size = MediaQuery.of( context ).size;

    return Container(
      margin: const EdgeInsets.only( top: 20),
      padding: const EdgeInsets.symmetric( horizontal:  20 ),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage( 'assets/loading.gif' ), 
                image: NetworkImage( movie.fullPosterImg ),
                height: 150,
                width: 110,
                ),
              ),
          ),
            const SizedBox(width: 20,),
             ConstrainedBox(
              constraints: BoxConstraints( maxWidth: size.width-200 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //titulo
                  Text( 
                    movie.title, 
                    style: textTheme.headlineMedium, 
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 2, 
               
                  ),
               
                  Text( 
                    movie.originalTitle, 
                    style: textTheme.bodyMedium, 
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 1, 
                  ),
                  Row(
                    children: [
                      for(int i=0; i<=10;++i)
                      if (i<voteAvg.truncate())
                      const Icon( Icons.star, size: 15,)
                      else const Icon( Icons.star_outline, size: 15, color: Colors.grey,),
                      const SizedBox( width: 5,),
                      Text( '${voteAvg}', style: textTheme.bodySmall, )
                    ],
                  )
                ],
                           ),
             )
        ],
      ),

    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;

  const _Overview({
    required this.movie
    });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.labelLarge,
        )
    );
  }
}