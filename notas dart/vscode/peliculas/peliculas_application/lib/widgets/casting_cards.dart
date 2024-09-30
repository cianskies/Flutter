import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_application/providers/movies_provider.dart';
import 'package:provider/provider.dart';


import '../models/models.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards({
    super.key, 
    required this.movieId
    });

  @override
  Widget build(BuildContext context) {
    
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);


    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: ( _ , AsyncSnapshot<List<Cast>> snapshot) {
        
        if(!snapshot.hasData){
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }else{
          List<Cast> cast = snapshot.data!;
          return Container(
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_ , int index) {
              return _CastingCard( cast:  cast[index],);
            },
          )
          ); 
        }
      
        },
    );


  }
}
class _CastingCard extends StatelessWidget {
  final Cast cast;
  const _CastingCard({
    required this.cast
  });

  @override
  Widget build(BuildContext context) {

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 100,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage( 'assets/no-image.jpg'), 
                  image: NetworkImage( cast.fullProfilePath ),
                  height: 140,
                  width: 100,
                  fit: BoxFit.cover
                  ),
              ),
            ),

            SizedBox(height: 5,),

            Text(
              cast.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
  }
}