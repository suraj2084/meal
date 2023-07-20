import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.mealModel, required this.onSelctMeal});
  final MealModel mealModel;
  String get complexityText {
    return mealModel.complexity.name[0].toUpperCase() +
        mealModel.complexity.name.substring(1);
  }

  String get affordabilityText {
    return mealModel.affordability.name[0].toUpperCase() +
        mealModel.affordability.name.substring(1);
  }

  final void Function(MealModel mealModel) onSelctMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelctMeal(mealModel);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealModel.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        mealModel.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${mealModel.duration} min'),
                          const SizedBox(width: 12),
                          MealItemTrait(
                              icon: Icons.work, label: complexityText),
                          const SizedBox(width: 12),
                          MealItemTrait(
                              icon: Icons.money, label: affordabilityText),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
