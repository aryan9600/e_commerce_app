import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('${widget.order.amount}'),
            subtitle: Text(DateFormat('dd MM yy hh:mm').format(widget.order.datetime)),
            trailing: IconButton(
              onPressed: (){
                setState(() {
                  expanded = !expanded;
                });
              },
              icon: expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
            ),
          ),
          if (expanded)
            Container(
              padding: const EdgeInsets.all(5),
              //height: min(widget.order.products.length*20.0 + 10.0, 10.0),
              height: 50,
              child: ListView(
                children: widget.order.products.map((prod) => 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(prod.title, style: TextStyle(fontWeight: FontWeight.w500)),
                      Text('${prod.quantity} X ${prod.price}', style: TextStyle(fontStyle: FontStyle.italic),)
                    ],
                  )
                ).toList()
               
              )
            )

        ],
      ),
    );
  }
}