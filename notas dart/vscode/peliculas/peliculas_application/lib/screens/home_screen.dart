import 'package:flutter/material.dart';
import 'package:peliculas_application/providers/movies_provider.dart';
import 'package:peliculas_application/search/search_delegate.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    print('peliculas populares  ${moviesProvider.popularMovies}');

    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Peliculas en cines' ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
              icon: const Icon(Icons.search)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            // Tarjetas principales
            CardSwiper(movies : moviesProvider.onDisplayMovies),
        
            //Slider de peliculas (parte de abajo de la pantalla)
            MovieSlider( movies : moviesProvider.popularMovies, //obtener peliculas populares
              title: 'Populares', 
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
        
          ] 
        ),
      ),
    );
  }
}