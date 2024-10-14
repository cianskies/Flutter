import 'package:flutter/material.dart';
import 'package:products/models/models.dart';
import 'package:products/screens/screens.dart';
import 'package:products/services/services.dart';
import 'package:products/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false );

    if(productsService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text( 'Productos', style: TextStyle(color: Colors.white), ),
        actions: [
          IconButton(
            onPressed: () async{

              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            }, 
            icon: const Icon( Icons.logout, color: Colors.white, ))
        ],
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: ( _ , index ) => GestureDetector(
          onTap: (){
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(product: productsService.products[index],)
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            
            productsService.selectedProduct = Product(aviable: true, name: '', price: 0);

            Navigator.pushNamed(context, 'product' );
          },
          child: const Icon( Icons.add, color: Colors.white, ),
        ),
   );
  }
}