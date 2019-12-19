
import 'package:flutter/material.dart';

import '../ProductModel.dart';


class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;

  ProductScreen(this._valueSetter);

  List<ProductModel> products = [
    ProductModel("Mic", 50),
    ProductModel("LED Monitor", 100),
    ProductModel("Mouse", 5),
    ProductModel("Keyboard", 10),
    ProductModel("Speaker", 50),
    ProductModel("CD", 3),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          return ListTile(
            title: Text(products[index].name),
            trailing: Text("\$${products[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
            onTap: (){
              _valueSetter(products[index]);
            },
          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
        itemCount: products.length
    );
  }
}
