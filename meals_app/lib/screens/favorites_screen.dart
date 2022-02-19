import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          var meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageURL: meal.imageURL,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
          );
        },
      );
    }
  }
}
