import 'package:cartapp/ProductModel.dart';
import 'package:cartapp/screens/CheckoutScreen.dart';
import 'package:cartapp/screens/ProductScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: CartApp()
    );
  }
}

class CartApp extends StatefulWidget {
  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart App"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Products",),
              Tab(text: "Checkout",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct){
              setState(() {
                cart.add(selectedProduct);//update
                sum = 0;
                cart.forEach((item){
                  sum = sum + item.price;
                });
              });
            }),
            CheckoutScreen(cart, sum),
          ],
        ),
      ),
    );
  }
}

