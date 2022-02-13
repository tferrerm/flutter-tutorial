import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;
  final Function saveFilters;

  const FiltersScreen(
      {required this.filters, required this.saveFilters, Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  void _glutenSetter(val) => _glutenFree = val;
  void _vegetarianSetter(val) => _vegetarian = val;
  void _veganSetter(val) => _vegan = val;
  void _lactoseSetter(val) => _lactoseFree = val;

  Widget buildSwitch(
      String title, String subtitle, bool value, Function setter) {
    return SwitchListTile(
      value: value,
      onChanged: (newValue) {
        setState(() {
          setter(newValue);
        });
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  void initState() {
    super.initState();

    _glutenFree = widget.filters['gluten']!;
    _vegetarian = widget.filters['vegetarian']!;
    _vegan = widget.filters['vegan']!;
    _lactoseFree = widget.filters['lactose']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitch(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    _glutenSetter,
                  ),
                  buildSwitch(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _vegetarian,
                    _vegetarianSetter,
                  ),
                  buildSwitch(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                    _veganSetter,
                  ),
                  buildSwitch(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _lactoseFree,
                    _lactoseSetter,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
