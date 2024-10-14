import 'package:flutter/material.dart';
import 'package:products/providers/login_form_provider.dart';
import 'package:products/screens/home_screen.dart';
import 'package:products/services/auth_service.dart';
import 'package:products/services/services.dart';
import 'package:products/ui/input_decorations.dart';
import 'package:products/widgets/widgets.dart';
import 'package:provider/provider.dart';

class UserRegisterScreen extends StatelessWidget {
   
  const UserRegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthBackground(
            child: SingleChildScrollView(
              child: Column(
                 children: [
                  const SizedBox( height: 250, ),
                  CardContainer(  child: Column(
                    children: [
                      const SizedBox( height: 10,),
                      Text( 'Registrar un nuevo usuario',style: Theme.of( context ).textTheme.headlineLarge ),
                      const SizedBox( height: 30,),

                      ChangeNotifierProvider(
                        create: ( _ ) => LoginFormProvider(),
                        child: const _LoginForm(),
                        ),

                    ],
                  ), 
                ),

                const SizedBox( height: 50, ),

                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed( context, 'login' ), 
                  child: const Text( '¿Ya tienes una cuenta?', style: TextStyle( fontSize: 20 ), )
                ),

                const SizedBox( height: 50, ),

                ],
              ),
            )
          )
          ]
        ),
      
    );
  }
}
class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>( context );

    return Container(
      
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'ejemplo@tuempresa.com',
                labelText: 'Correo Electrónico',
                prefixIcon: Icons.alternate_email_rounded
                ), 
              onChanged: ( value ) => loginForm.email = value,
                validator: ( value ){
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);

                  return regExp.hasMatch( value ?? '')
                  ? null
                  : 'Debe introducir una dirección de correo válida';
                },
            ),

            const SizedBox(height: 30,),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ), 
              onChanged: ( value ) => loginForm.password = value, 
              validator: ( value ){
                if  ( value != null && value.length>=6 ){
                  return null;
                }else {
                  return 'La contraseña debe tener más de 6 caracteres';
                }
              },
            ),

            const SizedBox(height: 30,),

            MaterialButton(
              onPressed: loginForm.isLoading ? null : () async {
                FocusScope.of(context).unfocus();
                if( !loginForm.isValidForm() ) return;
                  
                FocusScope.of(context).unfocus();
                final authServ = Provider.of<AuthService>( context, listen: false );
                loginForm.isLoading = true;

                final String? erroMessage = await authServ.createUser(loginForm.email, loginForm.password);

                if ( erroMessage==null){
                  Navigator.pushReplacementNamed(context, 'home', );
                }else{
                  NotificationsService.showSnackbar( erroMessage );
                  print( erroMessage );
                  
                }

                loginForm.isLoading = false; 


                
              },
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text( 
                  loginForm.isLoading
                  ? 'Espere'
                  : 'Iniciar Sesión', 
                  style: TextStyle( color: Colors.white ), ),
              ),
            
            ),


          ],
        )
        ),
    );
  }
}