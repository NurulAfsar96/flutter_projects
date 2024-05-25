import 'package:crud_assignment/product.dart';
import 'package:crud_assignment/themedata.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  final Function(Product) newProduct;
  const AddProductPage({super.key, required this.newProduct});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _imageController =TextEditingController();

  final List<Product> _products = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Product"),
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
                  decoration: ButtonStyles.textFieldStyle.copyWith(
                    label: Text("Unit Price"),
                    hintText: "Enter Product Price",
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _quantityController,
                  decoration: ButtonStyles.textFieldStyle.copyWith(
                    label: Text("Quantity"),
                    hintText: "Enter Product Quantity",
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _imageController,
                    decoration: ButtonStyles.textFieldStyle.copyWith(
                      hintText: "Enter your image url",
                      label: Text("Image URL"),

                    )

                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: _newProduct,
                  child: Text("Add"), style: ButtonStyles.elevatedButton,)
              ],
            ),
          ),
        )

    );
  }

  void _newProduct() {
    final id = int.tryParse(_idController.text);
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text);
    final quantity = int.tryParse(_quantityController.text);
    final image =_imageController.text;

    if (id != null && name.isNotEmpty && price != null && quantity != null && image != null) {
      final newProduct = Product(
          productId: id,
          productName: name,
          unitPrice: price,
          quantity: quantity,
          imageUrl: image,
      );
      widget.newProduct(newProduct);
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

}
