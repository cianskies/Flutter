import 'package:fl_components/themes/app_themes.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  
  double _sliderValue=100; 
  bool _sliderEnabled=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text( 'Sliders y checks' ),
      ),
      body: Column(
        children: [
          Slider(
            min: 50,
            value: _sliderValue,
            max: 400, 
            activeColor: AppThemes.primary,
            onChanged: _sliderEnabled ? 
            ( value ) {
              _sliderValue= value;
              setState(() {});
              print( value ); 

            }
            :null,

          ),
          CheckboxListTile(
            title: const Text( 'Habilitar Slider' ),
            value: _sliderEnabled, 
            onChanged: ( value ){ 
              _sliderEnabled = value ?? true;
              setState(() {});
            },
          ),
          SwitchListTile(
            title: const Text( 'Habilitar Slider' ),
            value: _sliderEnabled, 
            onChanged: ( value ){
              _sliderEnabled= value;
              setState(() {});
            }
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage( 'https://ssb.wiki.gallery/images/9/9e/Cloud_Strife.png' ),
                fit: BoxFit.contain,
                width: _sliderValue*1.5,
              ),
            ),
          ),

        ],
      ),
    );
  }
}