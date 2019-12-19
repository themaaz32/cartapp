import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final cart;
  final sum;

  CheckoutScreen(this.cart, this.sum);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
            itemBuilder: (context, index){
              return ListTile(
                title: Text(cart[index].name),
                trailing: Text("\$${cart[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
                onTap: (){

                },
              );
            },
            separatorBuilder: (context, index){
              return Divider();
            },
            itemCount: cart.length,
            shrinkWrap: true,
        ),
        Divider(),
        Text("Total : \$$sum"),

      ],
    );
  }
}
