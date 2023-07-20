import 'package:flutter/material.dart';
import 'package:meals/Screens/meal_detail.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});
  final String? title;
  final List<MealModel> meals;
  final void Function(MealModel meal) onToggleFavorite;

  void selectMeal(BuildContext context, MealModel mealMoel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (cnt) => MealDetailScreen(
          onToggleFavorite: onToggleFavorite,
          mealModel: mealMoel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Uh Oh,,, nothing here!",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Try selecting a different Category!",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(
            mealModel: meals[index],
            onSelctMeal: (meals) {
              selectMeal(context, meals);
            },
          );
        },
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
