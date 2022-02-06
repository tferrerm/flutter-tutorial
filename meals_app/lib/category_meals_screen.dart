import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMealsScreen(
      {Key? key/*, required this.categoryId, required this.categoryTitle*/})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final String categoryTitle = routeArgs['categoryTitle'] as String;
    // final String categoryId = routeArgs['categoryId'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(categoryTitle),
      ),
    );
  }
}
