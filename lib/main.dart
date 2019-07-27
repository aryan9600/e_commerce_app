import 'package:ecommerce/providers/cart.dart';
import 'package:ecommerce/providers/orders.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/edit_product_screen.dart';
import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/products_provider.dart';
import './screens/order_screen.dart';
import './screens/user_products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],
      child: MaterialApp(
      title: 'E-commerce app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.deepOrangeAccent
      ),
      home: ProductOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        OrderScreen.routeName: (ctx) => OrderScreen(),
        UserProductScreen.routeName: (ctx) => UserProductScreen(),
        EditProductScreen.routeName: (ctx) => EditProductScreen()
      },
    )
    );
  }
}
