import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;



  const MovieSlider({
    super.key, 
    required this.movies, 
    this.title,
    required this.onNextPage, 

    });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){

      if( scrollController.position.pixels>=scrollController.position.maxScrollExtent - 500 ){
        print( 'obtener siguiente pagina');
        widget.onNextPage();
      }

    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20.0),
            child: Text( widget.title ?? 'No title', style: const TextStyle( fontSize: 30, fontWeight: FontWeight.bold ),),
          ),

          const SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (BuildContext context, int index) => _MovieListViewItem(movie: widget.movies[index],),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieListViewItem extends StatelessWidget {

  final Movie movie;
  

  const _MovieListViewItem({required this.movie});

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'slider-${movie.id}';
    return Container(
                  width: 130,
                  height: 190,
                  margin: const EdgeInsets.symmetric(horizontal: 10, ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed( context, 'details', arguments: movie ),
                        child: Hero(
                          tag: movie.heroId!,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              placeholder: const AssetImage( 'assets/no-image.jpg' ),
                               image: NetworkImage(movie.fullPosterImg),
                            ),
                          ),
                        ),
                      ),
                      Text( movie.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
  }
} 