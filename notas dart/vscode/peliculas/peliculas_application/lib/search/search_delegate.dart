import 'package:flutter/material.dart';
import 'package:peliculas_application/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  String get searchFieldLabel => 'Buscar peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = ''  , //vaciar query button
        icon: const Icon( Icons.clear )
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(
        onPressed: () => close( context, null ), //volver a pantalla principal button
        icon: const Icon( Icons.arrow_back )
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return Text( 'Build results' );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty){return const _NoDataWidget();}

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false); 
    //print( 'http request' );
    moviesProvider.getSuggestionsByQuery( query );
    return StreamBuilder(

        stream: moviesProvider.suggestionStream,
        builder: ( _ , AsyncSnapshot<List<Movie>> snapshot) {
            
            if(!snapshot.hasData) return const _NoDataWidget();

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ( _, index) {
                Movie movie = snapshot.data![index];
                return _MovieSearchResult(movie: movie);
              }
            );
          } 
        
      );
    }
}


class _MovieSearchResult extends StatelessWidget {

  const _MovieSearchResult({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage( 'assets/loading.gif'), 
          image: NetworkImage( movie.fullPosterImg ),
          width: 50,
          fit: BoxFit.contain,
          ),
      ),
        title: Text( movie.title ),
        subtitle: Text( movie.originalTitle ),
        onTap:() => Navigator.pushNamed( context, 'details', arguments:  movie )
    );
  }
}

class _NoDataWidget extends StatelessWidget {
  const _NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Icon( Icons.movie_creation_outlined, color: Colors.black38, size: 130, ),
      ),
    );
  }
}