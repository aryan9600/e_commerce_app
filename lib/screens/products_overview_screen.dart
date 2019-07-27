import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/drawer.dart';
import '../screens/cart_screen.dart';

enum FilterFavs{
  Favs,
  All
}

class ProductOverviewScreen extends StatefulWidget {

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {

  var _showOnlyFavs = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Everything is so fkn cheap'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterFavs selectedValue){
              setState(() {
                if (selectedValue == FilterFavs.Favs){
                  _showOnlyFavs = true;
                }
                else{
                  _showOnlyFavs = false;
                }  
              });
            },
            icon: Icon(Icons.more_vert,),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only favs'), value: FilterFavs.Favs),
              PopupMenuItem(child: Text('Show all'), value: FilterFavs.All,)
            ],
          ),
          Consumer<Cart>(builder: (_,cart, ch) => 
            Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFavs)
    );
  }
}

