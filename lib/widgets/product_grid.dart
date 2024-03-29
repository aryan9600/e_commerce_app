import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavs;

  ProductGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: products.length,
      itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
        value: products[i],  
        child: ProductItem(
          // products[i].id,
          // products[i].title,
          // products[i].imageUrl,
          // products[i].price
        ),
      ),
    );
  }
}