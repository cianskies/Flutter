import 'package:fl_components/models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static final menuOptions= <MenuOption>[
    MenuOption(name: 'Home Screen', route: 'home', icon: Icons.home, screen: const HomeScreen()),
    MenuOption(name: 'ListView Tipo 1', route: 'listivew1', icon: Icons.list, screen: const ListView1Screen()),
    MenuOption(name: 'ListView Tipo 2', route: 'listview2', icon: Icons.list_alt_outlined, screen: const ListView2Screen()),
    MenuOption(name: 'Alerta Screen', route: 'alertscreen', icon: Icons.warning, screen: const AlertScreen()),
    MenuOption(name: 'Carta Screen', route: 'cardscreen', icon: Icons.card_giftcard, screen: const CardScreen()),
    MenuOption(name: 'Avatar Screen', route: 'avatarscreen', icon: Icons.person, screen: const AvatarScreen()),
    MenuOption(name: 'Animated Screen', route: 'animatedscreen', icon: Icons.animation, screen: const AnimatedScreen()),
    MenuOption(name: 'Input Screen', route: 'inputscreen', icon: Icons.keyboard, screen: const InputsScreen()),
    MenuOption(name: 'Slider Screen', route: 'sliderscreen', icon: Icons.slideshow_rounded, screen: const SliderScreen()),
    MenuOption(name: 'Infinite Scroll & Pull to Refresh', route: 'listviewbuilderscreen', icon: Icons.list_sharp, screen: const ListviewBuilderScreen()),

  ];
  static const initialRoute= 'home';
  static Map<String, Widget Function(BuildContext)> getAppRoutes(){

      Map<String, Widget Function(BuildContext)> appRoutes={};
      for(final option in menuOptions){
        appRoutes.addAll({ option.route : (BuildContext ctx) => option.screen });
      }

    return appRoutes;
  }
  // static Map<String, Widget Function(BuildContext)> routes={
  //       'home' : ( BuildContext ctx ) => const HomeScreen(),
  //       'listview1' : ( BuildContext ctx ) => const ListView1Screen(),
  //       'listview2' : ( BuildContext ctx ) => const ListView2Screen(),
  //       'alertscreen' : ( BuildContext ctx ) => const AlertScreen(),
  //       'cardscreen' : ( BuildContext ctx ) => const CardScreen()
  //     };
      static Route<dynamic> onGenerateRoute (RouteSettings settings){
        print(settings);
        return MaterialPageRoute(
             builder: (context) => const AlertScreen()
             );
      }
}