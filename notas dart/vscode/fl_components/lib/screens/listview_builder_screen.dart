import 'package:fl_components/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatefulWidget {
   
  const ListviewBuilderScreen({super.key});

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {

  final List<int> imagesId = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController _scrollController= ScrollController();
  bool isLoading = false;


  Future fetchData() async{

    if(isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed( const Duration( seconds: 2));

    add5Img();

    isLoading=false;
    setState(() {});
    if( _scrollController.position.pixels+100 >= _scrollController.position.maxScrollExtent ){
    _scrollController.animateTo(
      _scrollController.position.pixels + 100, 
      duration: const Duration( milliseconds: 300), 
      curve: Curves.fastOutSlowIn
      );
    }

  }

  void add5Img(){
    final lastId= imagesId.last;
    imagesId.addAll(
      [1,2,3,4,5].map( (e) => lastId + e),
    );
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed( const Duration( milliseconds: 500) );
    final lastId= imagesId.last;

    imagesId.clear();
    imagesId.add(lastId+1);
    add5Img();
    setState(() {});
  }

  @override
  void initState() {
    _scrollController.addListener((){
      if( _scrollController.position.pixels + 500 > _scrollController.position.maxScrollExtent  ){
        fetchData();
        print( 'se añaden 5 img');
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of( context ).size;
    return Scaffold(

      body: MediaQuery.removePadding(    
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [

            RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: imagesId.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('https://picsum.photos/500/300?=${ imagesId[index]}'));
                },
              ),
            ),
            if( isLoading )
              Positioned(
                bottom: 40,
                left: (size.width/2)-30,
                child: Container(
                
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)
                  ),
                  width: 60,
                  height: 60,
                  child: const CircularProgressIndicator(
                      color: Colors.red,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}