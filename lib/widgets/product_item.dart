import 'package:ecommerce/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {

  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;

  // const ProductItem(this.id, this.title, this.imageUrl, this.price);
  
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10,),
      child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: GridTile(
          child: Image.network(product.imageUrl),
          footer: GridTileBar(
            backgroundColor: Colors.grey[700],
            title: Text(product.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                  icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).accentColor,), 
                  onPressed: (){product.toggleFavStatus();},
                ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart, color: Theme.of(context).accentColor,), 
              onPressed: (){
                cart.addItem(product.id, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added item to the cart',),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'Undo', 
                      onPressed: (){
                        cart.removeSinglItem(product.id);
                      },
                    ),
                  )
                );
              },),
          ),
          header: GridTileBar(
            title: Text(product.price.toString(),),
            backgroundColor: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}