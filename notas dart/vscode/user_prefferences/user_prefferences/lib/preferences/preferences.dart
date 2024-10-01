import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  
  static SharedPreferences?  _prefs;
  
  static String _name = "";
  static bool _isDarkmode = false;
  static int _gender =1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  } 

  static String get name {
    return _prefs!.getString( 'name' ) ?? _name;
  }
  static set name( String name ){
    _name = name;
    _prefs?.setString('name', name); 
  }

  static bool get isDarkMode {
    return _prefs!.getBool( 'isDarkMode' ) ?? _isDarkmode;
  }
  static set isDarkMode( bool value ){
    _isDarkmode = value;
    _prefs?.setBool('isDarkMode', value); 
  }
  
  static int get gender {
    return _prefs!.getInt( 'gender' ) ?? _gender;
  }
  static set gender( int gender ){
    _gender = gender;
    _prefs?.setInt('gender', gender); 
  }
}