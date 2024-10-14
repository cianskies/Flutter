import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Product product;

  ProductFormProvider( this.product );



  bool isValidForm(){
    print( product.name );
    return formKey.currentState?.validate() ?? false;
  }

  updateAviabilty( bool value ){
    product.aviable = value;
    notifyListeners();
  }

}