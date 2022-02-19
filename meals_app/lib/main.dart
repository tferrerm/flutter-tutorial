import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  final Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      for (var key in filters.keys) {
        if (filterData.containsKey(key)) {
          filters[key] = filterData[key]!;
        }
      }
      _availableMeals = dummyMeals.where((meal) {
        return mealMatchesFilter(filters['gluten']!, meal.isGlutenFree) &&
            mealMatchesFilter(filters['lactose']!, meal.isLactoseFree) &&
            mealMatchesFilter(filters['vegetarian']!, meal.isVegetarian) &&
            mealMatchesFilter(filters['vegan']!, meal.isVegan);
      }).toList();
    });
  }

  bool mealMatchesFilter(bool filter, bool mealAttribute) {
    return (!filter || mealAttribute);
  }

  void _toggleFavorite(String mealId) {
    final mealIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (mealIndex == -1) {
      setState(() {
        _favoriteMeals.add(_availableMeals.singleWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        _favoriteMeals.removeAt(mealIndex);
      });
    }
  }

  bool _isFavoriteMeal(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      // home: const TabsScreen(),
      // initialRoute: '/', (default is '/')
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(meals: _availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(toggleFavorite: _toggleFavorite, isFavorite: _isFavoriteMeal),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(filters: filters, saveFilters: _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
