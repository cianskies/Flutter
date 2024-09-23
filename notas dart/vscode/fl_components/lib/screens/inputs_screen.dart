import 'package:fl_components/themes/app_themes.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFromKey=GlobalKey<FormState>();

    final Map< String, String > formValues={
      'first-name': 'Roberto',
      'last-name' : 'Pavon',
      'email'     : 'robertopavon@gmail.com',
      'password'  : 'Roberto332',
      'role'      : 'admin'

    };

    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Inputs de texto' ),
        backgroundColor: Colors.pink.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFromKey,
          child: Column(
            children: [
              CustomInputWidget(labelText: 'Nombre', helperText:  'Escribe tu nombre', icon: const Icon( Icons.person), formPropierty: 'first-name', formValues: formValues,),
              const SizedBox(  height: 30, ),
          
              CustomInputWidget(labelText: 'Apellido', helperText: 'Escribe tu apellido', formPropierty: 'last-name', formValues: formValues,),
              const SizedBox(  height: 30, ),
          
              CustomInputWidget(labelText: 'Correo', helperText: 'ejemplo@tuempresa.es', inputType: TextInputType.emailAddress, formPropierty: 'email', formValues: formValues,),
              const SizedBox(  height: 30, ),
          
              CustomInputWidget(labelText: 'Contraseña', helperText: 'Escribe una Contraseña de al menos 8 caracteres', hideInput: true, formPropierty: 'password', formValues: formValues,),
              const SizedBox(  height: 30, ),

              DropdownButtonFormField(
                value: 'Admin',
                items: const [
                  DropdownMenuItem(value: 'Admin', child: Text( 'Admin' )),
                  DropdownMenuItem(value: 'Super User', child: Text( 'Super User' )),
                  DropdownMenuItem(value: 'Developer', child: Text( 'Developer' )),
                ], 
              onChanged: ( value ){
                print( value );
                formValues[ 'role' ] = value ?? 'Admin';
                }
              ),

              ElevatedButton( 
                onPressed: (){
                  FocusScope.of( context ).requestFocus( FocusNode() );
                  
                  if(!myFromKey.currentState!.validate()){
                    print( 'Formulario no valido' );
                  }

                  print( formValues );
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text( 'Guardar' ))
                )
              ),
            ],
          ),
        ),
      )
    );
  }


}

