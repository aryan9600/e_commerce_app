import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/user_product_item.dart';
import '../widgets/drawer.dart';
import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName  = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => UserProductItem(title: productsData.items[i].title, imageUrl: productsData.items[i].imageUrl, id: productsData.items[i].id) 
        ),
      ),
    );
  }
}