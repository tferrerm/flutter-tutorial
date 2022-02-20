import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';
import '../dummy_data.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;

  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, index) {
          var product = loadedProducts[index];
          return ProductItem(
            id: product.id,
            title: product.title,
            imageURL: product.imageURL,
          );
        },
      ),
    );
  }
}
