import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class AuthService extends ChangeNotifier {

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _fireBaseToken = 'AIzaSyDciareBOzINOVAB29_3hVJ9RBj2ar-iFc';

  final storage = const FlutterSecureStorage();

  //si devuelve algo distinto de null, es un error
  Future<String?> createUser( String email, String password ) async {

    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password,
      'returnSecureToken' : true
    };

    final url = Uri.https( _baseUrl, '/v1/accounts:signUp', {
      'key' : _fireBaseToken
    });

    final response = await post( url, body: jsonEncode( authData ) );
    final Map<String, dynamic> decodedResponse = jsonDecode( response.body );

    if ( decodedResponse.containsKey( 'idToken' ) ){
      //hay que guardar el idtoken en un lugar seguro
      await storage.write( key: 'idToken', value: decodedResponse[ 'idToken' ] );
      return null;

    }else{
      return decodedResponse[ 'error' ][ 'message' ];
    }
  }


  Future<String?> login( String email, String password ) async {

    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password,
      'returnSecureToken' : true
    };

    final url = Uri.https( _baseUrl, '/v1/accounts:signInWithPassword', {
      'key' : _fireBaseToken
    });

    final response = await post( url, body: jsonEncode( authData ) );
    final Map<String, dynamic> decodedResponse = jsonDecode( response.body );

    if ( decodedResponse.containsKey( 'idToken' ) ){
      //hay que guardar el idtoken en un lugar seguro
        await storage.write( key: 'idToken', value: decodedResponse[ 'idToken' ] );
      return null;

    }else{
      return decodedResponse[ 'error' ][ 'message' ];
    }
  }

  Future logout() async {
    await storage.delete(key: 'idToken');
    return;
  }

  Future<String> readToken() async{
    return await storage.read(key: 'idToken') ?? '';
  }

}