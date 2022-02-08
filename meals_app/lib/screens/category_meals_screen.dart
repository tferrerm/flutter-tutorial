import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMealsScreen(
      {Key? key /*, required this.categoryId, required this.categoryTitle*/})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['categoryTitle'] as String;
    final categoryId = routeArgs['categoryId'] as String;
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            var meal = categoryMeals[index];
            return MealItem(
              id: meal.id,
              title: meal.title,
              imageURL: meal.imageURL,
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration,
            );
          }),
    );
  }
}
