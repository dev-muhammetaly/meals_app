import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/fliters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filtersScreen.dart';
import 'package:meals_app/screens/main_drawer.dart';
import 'package:meals_app/screens/mealsScreen.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  //list for controllling favorite meals(add/remove)
  // final List<Meal> _favoriteMeals = [];

  @override
  //function to inform user that meal added or not to favorite
  // function to check and add or remove meal from list
  // void _toggleFavoriteMeal(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //       showInfoMessage('The meal is no longer a favorite');
  //     });
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //       showInfoMessage('Marked as a favorite');
  //     });
  //   }
  // }
  // variables to control page and to name it
  int _selectedPageIndex = 0;
  var activePageTitle;

  //function to control selected page by index
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) => FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final activeFilters = ref.watch(filtersProvider);
    final avaibleMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(availableMeals: avaibleMeals);

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(title: 'Favorites', meals: favoriteMeals);
      activePageTitle = 'Your favorites';
    } else {
      activePageTitle = 'Categories';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(
        onSelectScreen: (String identifier) {
          _setScreen(identifier);
        },
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
