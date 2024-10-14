import 'package:flutter/material.dart';
import 'package:products/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, 
    required this.product
    });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only( top: 30, bottom: 50 ),
        height: 400,
        width: 400,
        decoration: _CardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackGroundImage( product: product,),

            _ProductDetails( product: product ),

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag( product: product ),
            ),
            
            if( !product.aviable )
            const Positioned(
              top: 0,
              left: 0,
              child: _NotAviable(),
              ),
          ],
        ),
      
      ),
    );
  }
  
  BoxDecoration _CardBorders(){
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 10,
          offset: Offset(0, 5)
        )
      ]
    );
  }

}

class _NotAviable extends StatelessWidget {
  const _NotAviable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only( topLeft: Radius.circular(25), bottomRight: Radius.circular(25) )
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 10 ),
          child: Text( 'No disponible', style: TextStyle( color: Colors.white, fontSize: 20), ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    super.key, 
    required this.product,
  });
  
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only( topRight: Radius.circular(25), bottomLeft: Radius.circular(25) )
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 10 ),
          child: Text( '${product.price}€', style: const TextStyle( color: Colors.white, fontSize: 20), ),
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    super.key, 
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( right: 50 ),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: _BuildBoxDecoration(),
        child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( product.name, 
              style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), 
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
              Text( product.id!, 
                style: const TextStyle( fontSize: 10, fontWeight: FontWeight.normal, color: Colors.white), 
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() => const BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(25), topRight: const Radius.circular(25), ),


  );
}

class _BackGroundImage extends StatelessWidget {
  const _BackGroundImage({
    super.key, 
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: double.infinity,
      child: FadeInImage(
        placeholder: const AssetImage( 'assets/jar-loading.gif' ), 
        image: product.picture != null
          ? NetworkImage( product.picture! )
          : const AssetImage( 'assets/no-image.png' ),
        fit: BoxFit.cover,
      ),
      ),
    );
  }
}
