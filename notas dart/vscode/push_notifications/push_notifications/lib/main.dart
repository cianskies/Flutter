import 'package:flutter/material.dart';
import 'package:push_notifications/screens/home_screen.dart';
import 'package:push_notifications/screens/message_screen.dart';
import 'package:push_notifications/services/push_notification_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PushNotificationService.messageStream.listen( ( message ){
      print( 'MyApp: $message' );

      navigatorKey.currentState?.pushNamed( 'message', arguments: message );


      final snackBar = SnackBar(content: Text( message ));
      messengerKey.currentState?.showSnackBar(snackBar);

    } );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      routes: {
        'home'    : ( _ ) => const HomeScreen(),
        'message' : ( _ ) => const MessageScreen(),

      },
    );
  }
}