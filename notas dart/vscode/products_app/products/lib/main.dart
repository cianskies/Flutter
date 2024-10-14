import 'package:flutter/material.dart';
import 'package:products/screens/screens.dart';
import 'package:products/services/services.dart';
import 'package:provider/provider.dart';


void main() => runApp(
  const AppState()
);

class AppState extends StatelessWidget {
  const AppState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: ( _ ) =>AuthService()),
      ChangeNotifierProvider(create: ( _ ) =>ProductsService()),
    ],
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos App',
      initialRoute: 'checkAuth',
      routes: {
        'home' : ( _ ) => HomeScreen(),
        'login': ( _ ) => const LoginScreen(),
        'product': ( _ ) => const ProductScreen(),
        'register': ( _ ) => const UserRegisterScreen(),
        'checkAuth': ( _ ) => const CheckAuthScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade300,
        appBarTheme: const AppBarTheme( centerTitle: true, color: Colors.indigo),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(  backgroundColor: Colors.indigo,)

      ),
    );
  }
}