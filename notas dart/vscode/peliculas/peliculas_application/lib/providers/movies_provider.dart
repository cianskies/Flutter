import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_application/helpers/debouncer.dart';
import 'package:peliculas_application/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  String _baseUrl='api.themoviedb.org';
  String _apiKey='57d216b07967c8d098523c0781bef2ba';
  String _language='es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> movieCast= {};
  int _popularPAgeIndex=0;

  final Debouncer debouncer = Debouncer(
    duration: const Duration( milliseconds: 500),

    );

  final StreamController<List<Movie>> _suggestionStreamController = StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream => _suggestionStreamController.stream;

  

  MoviesProvider(){
    print( 'MoviesProvider initialized' );
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonDataFromEndpointURL( String endpoint, [int page = 1] ) async{
      var url = Uri.https( _baseUrl, endpoint,
      //PARAMS
     { 'api_key' : _apiKey,
      'language' : _language,
      'page'     : '$page',
     } 
     );
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    String nowPlayingEndpoint = '3/movie/now_playing';

    final response = await _getJsonDataFromEndpointURL( nowPlayingEndpoint );
    final nowPlayingResponse = NowPlayingResponse.fromJson(response);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
  getPopularMovies() async {
    ++_popularPAgeIndex;
    String popularMoviesEndpoint = '3/movie/popular';

    final response = await _getJsonDataFromEndpointURL( popularMoviesEndpoint, _popularPAgeIndex );
    final popularResponse = PopularResponse.fromJson(response);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {

    if ( movieCast.containsKey(movieId) ) return movieCast[movieId]!;

    String movieCastEndpoint = '3/movie/$movieId/credits';
    final response = await _getJsonDataFromEndpointURL( movieCastEndpoint);
    final castResponse = CreditsResponse.fromJson(response);
    movieCast [movieId] = castResponse.cast;

    return castResponse.cast;


  }

  Future<List<Movie>> searchMovie( String query ) async {

    String movieSearchEndpoint = '3/search/movie';
    var url = Uri.https( _baseUrl, movieSearchEndpoint,
      //PARAMS
     { 'api_key' : _apiKey,
      'language' : _language,
      'query'     : '$query',
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;  

  }
  void getSuggestionsByQuery( String searchTerm ){
    debouncer.value = '';
    debouncer.onValue = ( value ) async {
      print( 'Tenemos valor a buscar : $value' );
      final results = await this.searchMovie( searchTerm );
      this._suggestionStreamController.add( results );
    };
  

  final timer =Timer.periodic( const Duration(milliseconds: 300), ( _ ){
    debouncer.value= searchTerm;
      }
    );
    Future.delayed( const Duration( milliseconds: 301 )).then( ( _ ) => timer.cancel() );

  }
}