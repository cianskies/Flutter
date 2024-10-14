import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:products/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  
  final String _baseUrl = 'flutter-varios-562d3-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Product> products = [];
  late Product? selectedProduct;

  final storage = const FlutterSecureStorage();

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;
  ProductsService(){
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {

    print( 'products service inicializado' );
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'Products.json',{
      'auth' : await storage.read( key: 'token' ) ?? ''
    } );
    final response = await get( url );

    final Map<String, dynamic> productsMap = jsonDecode( response.body );

    productsMap.forEach( ( key, value ){
      
      final tempProduct = Product.fromJson( value );
      tempProduct.id = key;

      this.products.add( tempProduct );

    } );

    this.isLoading = false;
    notifyListeners();

    return this.products;

  }

  Future saveOrCreateProduct( Product product ) async{
    isSaving = true;
    notifyListeners();

    if( product.id == null ){
      //crear nuevo producto
      this.createProduct(product);
    }else{
      //actualizar producto
      updateProduct(product);
    }

    isSaving = false;
    notifyListeners();

  }

  Future<String> updateProduct( Product product ) async{
    final url = Uri.https( _baseUrl, 'Products/${ product.id }.json',{
      'auth' : await storage.read( key: 'token' ) ?? ''
    } );
    //final resp = await http.get(url);
    final resp = await http.put( url, body: product.toJson() );
    final decodedData = resp.body;
    print(decodedData);

    final index = this.products.indexWhere( ( item ) => item.id == product.id );
    this.products[index] = product;
    notifyListeners();
    return product.id!;
  }

  Future<String> createProduct( Product product ) async{
    final url = Uri.https( _baseUrl, 'Products.json',{
      'auth' : await storage.read( key: 'token' ) ?? ''
    } );
    //final resp = await http.get(url);
    final resp = await http.post( url, body: product.toJson() );
    final decodedData = json.decode(resp.body);
    product.id = decodedData['name'];
    
    this.products.add( product );

    notifyListeners();
    return product.id!;
  }

  void updateSelectedProductImage( String path ){

    this.selectedProduct!.picture = path;
    this.newPictureFile = File.fromUri( Uri( path: path ) );

    notifyListeners();

  }

  Future<String?> uploadImage() async{
    if ( this.newPictureFile ==null ) return null;

    this.isSaving = true;
    notifyListeners();

    final url= Uri.parse( 'https://api.cloudinary.com/v1_1/df5nvumqe/image/upload?upload_preset=roberto' );

    final imageUploadRequest = await http.MultipartRequest( 'POST', url ) ;
    final file = await http.MultipartFile.fromPath( 'file', newPictureFile!.path );

    imageUploadRequest.files.add( file );
    
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream( streamResponse );
    
    if ( resp.statusCode != 200 && resp.statusCode != 201 ){
      print( 'err' );
      return null;
    }


    final decodedData = jsonDecode( resp.body );
    return decodedData[ 'secure_url' ];
    

  }

  
}