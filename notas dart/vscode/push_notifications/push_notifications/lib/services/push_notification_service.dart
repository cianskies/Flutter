import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/////////SHA1: FE:6F:85:62:A5:DA:84:EE:82:14:3C:4F:F3:E8:CA:5F:C2:D1:04:5B
class PushNotificationService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStreamController = StreamController.broadcast();
  static Stream<String> get messageStream => _messageStreamController.stream;


  static Future _backGroundHandler( RemoteMessage message ) async{
    print( 'background handler ${message.messageId}' );

    _messageStreamController.add( message.data['producto'] ?? 'no-title' );
  }
  
  static Future _onMessageHandler( RemoteMessage message ) async{
    print( 'on message handler ${message.messageId}' );

    _messageStreamController.add( message.data['producto'] ?? 'no-title' );
  }

  static Future _onMessageOpenAppHandler( RemoteMessage message ) async{
    print( 'onMessageOpenApp handler ${message.messageId}' );

    _messageStreamController.add( message.data['producto'] ?? 'no-title' );
  }

  static Future initializeApp() async{

    //Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    print( 'token $token' );

    //Handlers
    FirebaseMessaging.onBackgroundMessage( _backGroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler );
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenAppHandler );

  }

  static closeStreams(){
    _messageStreamController.close();
  }
}