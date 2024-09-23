import 'package:fl_components/screens/screens.dart';

class AppThemes {
  static const Color primary = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)
              ),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
              )
          )
        )
    );
}
