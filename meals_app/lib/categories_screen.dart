import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
        children: dummyCategories
            .map(
              (category) => CategoryItem(
                title: category.title,
                color: category.color,
              ),
            )
            .toList(),
        // Slivers are scrollable areas in our screen. GridDelegate: for the grid, this takes
        // care of structuring the layout, so it's delegated to this class.
        // Maximum width for this item with as many columns as there fit
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, // for 200 width I want to have 300 height.
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
