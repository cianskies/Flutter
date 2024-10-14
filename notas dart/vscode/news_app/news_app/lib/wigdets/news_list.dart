import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/theme/theme.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key, 
    required this.news
    });

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: ( _, int index) {
        return _NewsArticle(article: news[index], index: index);
      },
    );
  }
}

class _NewsArticle extends StatelessWidget {
  
  final Article article;
  final int index;

  _NewsArticle({
    required this.article,
    required this.index, 
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(article: article, index: index,),

        _TitleCard(article: article),

        _ImageCard(article: article),

        _BodyCard(article: article),

        const SizedBox( height: 10, ),

        const _ButtonCard(),

        const SizedBox( height: 20, ),
        const Divider()

      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {

  final Article article;
  final int index;

  const _TopBarCard({
    required this.article,
    required this.index, 
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      margin: const EdgeInsets.only( bottom: 10 ),
      child: Row(
        children: [
          Text( '${index+1}  ', style: TextStyle( color: newsTheme.highlightColor ), ),
          
          
          Text( article.source.name )
        ],
      ),

    );
  }
}

class _TitleCard extends StatelessWidget {

  final Article article;

  const _TitleCard({super.key, required this.article});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 15 ),
      child: Text( article.title, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold ), ),
    );
  }
}

class _ImageCard extends StatelessWidget {

  final Article article;

  const _ImageCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
      child: ( article.urlToImage != null )
      ? FadeInImage(
        fit: BoxFit.cover,
        placeholder: const AssetImage( 'assets/giphy.gif' ), 
        image: NetworkImage( article.urlToImage! ),
        imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) { 
          print( 'la imagen ${article.title} no carga' );
          return Image.asset('assets/no-image.png'); }
      )
      : const Image(  image: AssetImage( 'assets/no-image.png' ), ),
    );
  }
}

class _BodyCard extends StatelessWidget {

  final Article article;

  const _BodyCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Text( article.description ?? '' ),
    );
  }
}

class _ButtonCard extends StatelessWidget {
  const _ButtonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            fillColor: newsTheme.highlightColor,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: const Icon( Icons.star_border ),
          ),

          const SizedBox( width: 20, ),

          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: const Icon( Icons.more ),
          )
        ],
      )

    );
  }
}