import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart')
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text('Total', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 10,),
                  Chip(label: Text('${cart.totalAmount.toStringAsFixed(2)}'),),
                  FlatButton(
                    child: Text('Order now'),
                    onPressed: (){
                      Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              )
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => 
              CartItem(
                cart.items.values.toList()[i].id, 
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price, 
                cart.items.values.toList()[i].quantity, 
                cart.items.values.toList()[i].title
              )
            ),
          )
        ],
      ),
    );
  }
}