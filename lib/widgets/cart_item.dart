import 'package:flutter/material.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.id, this.productId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white, size: 40,),
        alignment:  Alignment.centerRight,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showDialog(
          context: context, 
          builder: (ctx) => 
          AlertDialog(
            title: Text('Confirm Deletion'),
            actions: <Widget>[
              FlatButton(
                child: Text('No', style: TextStyle(color: Colors.red),),
                onPressed: (){
                  Navigator.of(ctx).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes', style: TextStyle(color: Colors.blue),),
                onPressed: (){
                  Navigator.of(ctx).pop(true);
                },
              )
            ],
          )
        );
      },
      onDismissed: (direction){
        Provider.of<Cart>(context, listen:false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(child: Text('${price}')),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: ${(price*quantity)}'),
            trailing: Text('${quantity} X '),
          )  
        ),
      ),
    );
  }
}