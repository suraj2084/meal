import 'package:flutter/material.dart';
import 'package:meals/Data/categories_data.dart';
import 'package:meals/Screens/categories.dart';
import 'package:meals/Screens/filters.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/widget/main_drawer.dart';

const kInitialFilter = {
  Filter.gultenfree: false,
  Filter.loctosefree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<MealModel> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilter;
  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void toggleMealFavoriteStatus(MealModel meal) {
    final isExiting = _favoriteMeals.contains(meal);
    if (isExiting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      showInfoMessage('Meals is no longer as favorite.');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      showInfoMessage('Meals Marked as favorite.');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifer) async {
    if (identifer == 'Filters') {
      Navigator.of(context).pop();

      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
            builder: (ctx) => FiltersScreen(
                  currentFilter: _selectedFilters,
                )),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availbleMeal = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.gultenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.loctosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      onToggleFavorite: toggleMealFavoriteStatus,
      availableMeal: availbleMeal,
    );
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: toggleMealFavoriteStatus,
      );
      activePageTitle = 'Favorties';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categorys',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
