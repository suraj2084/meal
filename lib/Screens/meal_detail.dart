import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.mealModel, required this.onToggleFavorite});

  final MealModel mealModel;
  final void Function(MealModel meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
        backgroundColor: const Color.fromARGB(255, 157, 147, 117),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(mealModel);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              mealModel.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 12,
            ),
            for (String i in mealModel.ingredients)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  i,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 12,
            ),
            for (String i in mealModel.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  i,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
