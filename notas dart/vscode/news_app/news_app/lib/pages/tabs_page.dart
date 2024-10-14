import 'package:flutter/material.dart';
import 'package:news_app/pages/tab1_page.dart';
import 'package:news_app/pages/tab2_page.dart';
import 'package:news_app/services/news_service.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => _NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _NavigationBar()
          
         ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>( context );

    return BottomNavigationBar(
      currentIndex: navigationModel.pageIndex,
      onTap: ( value ) => navigationModel.pageIndex = value,
      items: const [
        BottomNavigationBarItem(icon: Icon( Icons.person_outline ), label: 'For You' ),
        BottomNavigationBarItem(icon: Icon( Icons.public ), label: 'Headers' )
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page()
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier{

  int _pageIndex = 0;
  PageController _pageController = PageController();
  
  int get pageIndex => _pageIndex;
  set pageIndex( int value ){
    _pageIndex = value;

    _pageController.animateToPage(_pageIndex, duration: const Duration( milliseconds: 200), curve: Curves.bounceInOut);

    notifyListeners();
  } 

  get pageController => _pageController;

}