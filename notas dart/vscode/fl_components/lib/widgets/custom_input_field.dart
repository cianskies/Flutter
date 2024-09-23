import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final Icon? icon;
  final TextInputType? inputType;
  final bool hideInput;

  final String formPropierty;
  final Map<String, String> formValues;

  const CustomInputWidget({
    super.key,
      this.hintText,
      this.helperText,
      this.labelText,
      this.icon,
      this.inputType,
      this.hideInput = false, 
      required this.formPropierty, 
      required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      onChanged: ( value ) => formValues[formPropierty] = value,
      validator:( value ) => validateStringName( value ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      obscureText: hideInput,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        icon: icon == null ? null : ( icon ),
        )
    );
  }
  String? validateStringName( String? name ){
    if(
        name!=null &&
        name.length<4
      ){
      return 'El nombre debe contener al menos 4 caracteres';
    }
  }
}