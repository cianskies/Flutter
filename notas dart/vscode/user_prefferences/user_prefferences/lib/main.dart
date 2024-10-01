import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_prefferences/preferences/preferences.dart';
import 'package:user_prefferences/providers/theme_provider.dart';
import 'package:user_prefferences/screens/screens.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkMode: Preferences.isDarkMode ) ),
    ],
    child: const MyApp(),
    ),
  );
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName : ( _ ) => const HomeScreen(),
        SettingsScreen.routerName : ( _ ) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>( context, listen:  true ).currentTheme,
    );
  }
}