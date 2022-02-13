import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
    // Context is not available here! So we cannot use ModalRoute.of(context)
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // whenever the references of the state change
    // ==> when the widget that belongs to the state has been fully initialized
    // ==> runs before build
    // need to use _loadedInitData so the state isn't overwritten and we can delete the meal

    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['categoryTitle'] as String;
      final categoryId = routeArgs['categoryId'] as String;
      displayedMeals = dummyMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: displayedMeals!.length,
        itemBuilder: (ctx, index) {
          var meal = displayedMeals![index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageURL: meal.imageURL,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
