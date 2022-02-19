import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

// TabBarView provides a view for each tab added to the TabBar (keep them ordered!)
class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>>? _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Favorites'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
