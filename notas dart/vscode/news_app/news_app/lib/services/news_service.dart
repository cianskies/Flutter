
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/services/news_response.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class NewsService extends ChangeNotifier{

  final String _apiKey = 'ba6c1f30e2104f4fae01488d2faab7ac';
  final String _baseUrl = 'newsapi.org';
  final String _country = 'us';

  List<Article> headlines = [];

  List<NewsCategory> categories = [
    NewsCategory( icon: FontAwesomeIcons.building, name: 'business'  ),
    NewsCategory( icon: FontAwesomeIcons.tv, name: 'entertainment'  ),
    NewsCategory( icon: FontAwesomeIcons.addressCard, name: 'general'  ),
    NewsCategory( icon: FontAwesomeIcons.headSideVirus, name: 'health'  ),
    NewsCategory( icon: FontAwesomeIcons.vials, name: 'science'  ),
    NewsCategory( icon: FontAwesomeIcons.volleyball, name: 'sports'  ),
    NewsCategory( icon: FontAwesomeIcons.memory, name: 'technology'  ),
  ];

  Map<String, List<Article>> categoryArticles = {};

  String _selectedCategory = 'business';

  NewsService(){

    getTopHeadLines();
    categories.forEach( (item){
      this.categoryArticles[item.name] = [];
    });
    getArticlesbyCategory( _selectedCategory );
  }
  get selectedCategory => _selectedCategory;
  set selectedCategory ( dynamic value) { 
    _selectedCategory = value;
    getArticlesbyCategory( _selectedCategory );
    notifyListeners();
  }
  List<Article>? get getArticlesbySelectedCategory => categoryArticles[ _selectedCategory ];

  getTopHeadLines () async{
    
    print( 'getting top headlines' );
    const String endpoint = '/v2/top-headlines';
    var url = Uri.https( _baseUrl, endpoint,
      //PARAMS
     { 'apiKey' : _apiKey,
      'country' : _country,
     } 
    );

    final response = await http.get(url);
    final topHeadLines = newsResponseFromJson(response.body);
    
    headlines.addAll( topHeadLines.articles );
    notifyListeners();
  }

  getArticlesbyCategory( String category ) async{

    if( categoryArticles[category]!.isNotEmpty ){
      return categoryArticles[category];
    }

    const String endpoint = '/v2/top-headlines';
    var url = Uri.https( _baseUrl, endpoint,
      //PARAMS
     {'apiKey'  : _apiKey,
      'country' : _country,
      'category': category
     } 
    );

    final response = await http.get(url);
    final articlesResponse = newsResponseFromJson(response.body);
    
    categoryArticles[category]?.addAll(articlesResponse.articles);
    notifyListeners();
  }

}