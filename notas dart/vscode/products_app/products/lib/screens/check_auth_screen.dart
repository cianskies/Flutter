import 'package:flutter/material.dart';
import 'package:products/screens/home_screen.dart';
import 'package:products/screens/login_screen.dart';
import 'package:products/services/auth_service.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
   
  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>( context, listen: false );

    return Scaffold(
      body: FutureBuilder(
        future: authService.readToken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

          if(!snapshot.hasData) {
            return const Text( 'Espere...' );
          }
          if(snapshot.data == '') {
            //no hay idToken, no hay usuario guardado, pide iniciar sesion
            Future.microtask((){
              Navigator.pushReplacement( context, PageRouteBuilder(
                pageBuilder: ( _, __, ___ ) => const LoginScreen(),
                transitionDuration: const Duration( seconds: 0 )
                ) 
              );
            });
          }else{
            //el idToken no es nulo, asi que recuerda al usuario que inicio sesion
            Future.microtask((){
              Navigator.pushReplacement( context, PageRouteBuilder(
                pageBuilder: ( _, __, ___ ) => HomeScreen(),
                transitionDuration: const Duration( seconds: 0 )
                ) 
              );
            });
          }

          return Container();
        },
      ),
    );
  }
}