import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:products/models/models.dart';
import 'package:products/providers/product_form_provider.dart';
import 'package:products/services/products_service.dart';
import 'package:products/ui/input_decorations.dart';
import 'package:products/widgets/product_image.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>( context );

    return ChangeNotifierProvider(
      create: ( _ ) => ProductFormProvider( productsService.selectedProduct! ),
      child: _ProductScreenBody(productsService: productsService),
    );
    //return _ProductScreenBody(productsService: productsService);
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    super.key,
    required this.productsService,
  });

  final ProductsService productsService;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>( context );

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage( url: productsService.selectedProduct?.picture, ),
                
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of( context ).pop(), 
                    icon: const Icon( Icons.arrow_back_ios_new, color: Colors.white
                    )
                  )
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 100
                      );
                      if ( pickedFile == null ){
                        print( 'no image returned' );
                        return;
                      }else{
                        print( 'tenemos imagen ${pickedFile.path}' );
                        productsService.updateSelectedProductImage( pickedFile.path );
                      }
                    }, 
                    icon: const Icon( Icons.camera_alt_outlined, color: Colors.white
                    )
                  )
                ),
              ],
            ),
    
            const _ProductForm()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
          productsService.isSaving
          ? null
          : () async {
            if( productForm.isValidForm() ){

              final String? imageUrl = await productsService.uploadImage();
              if( imageUrl != null ) productForm.product.picture = imageUrl;

              productsService.saveOrCreateProduct( productForm.product );
          }
        },
        child: 
        productsService.isLoading
        ? const CircularProgressIndicator( color: Colors.white, )
        : const Icon( Icons.save, color: Colors.white,),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

      final productForm = Provider.of<ProductFormProvider>( context );
      final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 300,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          child: Column(
            children: [
              const SizedBox(height: 10,),

              TextFormField(
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if ( value==null || value.length<3 ) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del Producto', 
                  labelText: 'Nombre'
                ),
              ),

              const SizedBox(height: 30,),

                TextFormField(
                  initialValue: '${product.price}',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if ( double.tryParse( value ) == null ) {
                      product.price = 0;
                    }else{
                      product.price = double.parse( value );
                    }
                  }, 
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                  hintText: '€150', 
                  labelText: 'Precio'
                ),
              ),

              const SizedBox(height: 30,),

              SwitchListTile.adaptive(
                value: product.aviable, 
                title: const Text( 'Disponible' ),
                onChanged: ( value ) {
                  productForm.updateAviabilty(value);
                }
              )
            ],
          )
          ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity( 0.05 ),
        offset: const Offset(0, 5),
        blurRadius: 5,
      )
    ]
  );
}