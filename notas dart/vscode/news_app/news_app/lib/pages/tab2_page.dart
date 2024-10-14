import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/wigdets/news_list.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context, listen: true );

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _CategoryList(),

            Expanded(
              child: NewsList(news: newsService.getArticlesbySelectedCategory! )
              )
          ],
        )
         ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;
    

    return Container(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final categoryName = categories[index].name;
          return Container(
            width: 110,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryButton( category: categories[index], ),
                  const SizedBox( height: 5, ),
                  Text( '${categoryName[0].toUpperCase()}${categoryName.substring(1)}' )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    super.key,
    required this.category,
  });

 final NewsCategory category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false );
    return GestureDetector(
      onTap: (){
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric( horizontal: 10 ),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: 
        ( newsService.selectedCategory == category.name )
        ? Icon( 
          category.icon,
          color: Colors.red,
        )
        : Icon( 
          category.icon,
          color: Colors.black,
        )
      ),
    );
  }
}