import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoritesOnly;

  const ProductsGrid({Key? key, required this.showFavoritesOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // establish direct communiaction channel to the provided instance of `Products'
    final productsData = Provider.of<Products>(context);
    final products = showFavoritesOnly ? productsData.favorites : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        // now the provider is tied to its data.
        // Important to use .value in all scenarios where we are providing our data on single list
        // items when the widgets will be recycled when they're off-screen
        // ChangeNotifierProvider automatically frees memory to avoid memleaks
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        );
      },
    );
  }
}
