import 'package:crud_assignment/add_product_page.dart';
import 'package:crud_assignment/product.dart';
import 'package:crud_assignment/update_product_page.dart';
import 'package:flutter/material.dart';




class CrudHomePage extends StatefulWidget {
  const CrudHomePage({super.key});

  @override
  State<CrudHomePage> createState() => _CrudHomePageState();
}

class _CrudHomePageState extends State<CrudHomePage> {

  final List<Product> _product=[];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: ListView.separated(
          itemCount: _product.length,
          itemBuilder: (context,index){
            final products =_product[index];
        return ListTile(
          leading: Image.network(products.imageUrl, width: 60,height: 60,),
          title: Text(products.productName),
          subtitle: Wrap(
            children: [

                Text("Price: ${products.unitPrice}"),
                SizedBox(width: 10,),
                Text("Quantity: ${products.quantity}"),
              SizedBox(width: 10,),
                Text("TotalPrice: ${products.unitPrice*products.quantity}"),

              ]
              ),
          trailing: Wrap(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProductPage(
                        product: _product[index],
                        editProduct: (updatedProduct)
                  {setState(() {
                    _product[index] =updatedProduct;

                  });}
                        ,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete_rounded),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Delete Product'),
                      content: Text('Do you want to delete this product?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _product.removeAt(index);
                            });
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),

        );


      },
        //separatorBuilder: (BuildContext context, int index) => const Divider(),),
        separatorBuilder: (_,__) => const Divider(),),
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductPage(
                newProduct: (product) {
                  setState(() {
                    _product.add(product);
                  });
                },
              ),
            ),
          );


        },
        child: Icon(Icons.add),
      ),


    );
  }
}
