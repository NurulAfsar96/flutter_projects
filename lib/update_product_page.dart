import 'package:crud_assignment/product.dart';
import 'package:crud_assignment/product_home_page.dart';
import 'package:crud_assignment/themedata.dart';
import 'package:flutter/material.dart';

class UpdateProductPage extends StatefulWidget {
  final Product product;
  final Function(Product) editProduct;

  const UpdateProductPage({super.key, required this.product, required this.editProduct,});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {

  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;
  late TextEditingController _imageController;


@override
  void initState() {
    super.initState();
    _idController = TextEditingController(text: widget.product.productId.toString());
    _nameController = TextEditingController(text: widget.product.productName);
    _priceController = TextEditingController(text: widget.product.unitPrice.toString());
    _quantityController = TextEditingController(text: widget.product.quantity.toString());
    _imageController =TextEditingController(text: widget.product.imageUrl.toString());
}

  void _updateProduct() {
    final id = int.tryParse(_idController.text);
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text);
    final quantity = int.tryParse(_quantityController.text);
    final image =_imageController.text;

    if (id != null && name.isNotEmpty && price != null && quantity != null && image != null) {
      final updateProduct = Product(
        productId: id,
        productName: name,
        unitPrice: price,
        quantity: quantity,
        imageUrl: image,
      );
      widget.editProduct(updateProduct);
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid Input'),
            content: Text('Please enter valid product details.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: ButtonStyles.textFieldStyle.copyWith(
                  label: Text("Product ID"),
                  hintText: "Enter Product ID",
                ),
              ),
              SizedBox(height: 16),

              TextField(
                controller: _nameController,
                decoration: ButtonStyles.textFieldStyle.copyWith(
                  label: Text("Product Name"),
                  hintText: "Enter Product Name",
                ),
              ),
              SizedBox(height: 16),

              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: ButtonStyles.textFieldStyle.copyWith(
                  label: Text("Unit Price"),
                  hintText: "Enter Product Price",
                ),
              ),
              SizedBox(height: 16),

              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: ButtonStyles.textFieldStyle.copyWith(
                  label: Text("Quantity"),
                  hintText: "Enter Product Quantity",
                ),
              ),
              SizedBox(height: 16),

              TextField(
                controller: _imageController,
                keyboardType: TextInputType.number,
                decoration: ButtonStyles.textFieldStyle.copyWith(
                  hintText: "Enter Image url",
                  label: Text("Image URL"),

                )

              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _updateProduct, child: Text("Update"), style: ButtonStyles.elevatedButton,)
            ],
          ),
        ),
      )
      
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

}
