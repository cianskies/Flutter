import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/wigdets/news_list.dart';
import 'package:provider/provider.dart';


class Tab1Page extends StatefulWidget {

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>( context );

    return Scaffold(
      body: Center(
        child: ( newsService.headlines.isEmpty )
          ? const CircularProgressIndicator()
          : NewsList(news: newsService.headlines),
     ),
   );
  }
  
  @override
  bool get wantKeepAlive => true;
}