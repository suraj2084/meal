import 'package:flutter/material.dart';
import 'package:meals/Data/categories_data.dart';
import 'package:meals/Screens/meals.dart';
import 'package:meals/models/categories_model.dart';
import 'package:meals/widget/category_grid_item.dart';

import '../models/meal_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, required this.onToggleFavorite, required this.availableMeal});
  final void Function(MealModel meal) onToggleFavorite;
  final List<MealModel> availableMeal;

  void _selectCategory(BuildContext context, CategoriesModel categoriesModel) {
    final fliterMeals = availableMeal
        .where((meal) => meal.categories.contains(categoriesModel.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(
                  title: categoriesModel.title,
                  meals: fliterMeals,
                  onToggleFavorite: onToggleFavorite,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20, //spacing between
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            selectCategory: () {
              _selectCategory(context, category);
            },
            categoriesModel: category,
          )
      ],
    );
  }
}
