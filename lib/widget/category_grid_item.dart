import 'package:flutter/material.dart';
import 'package:meals/models/categories_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.categoriesModel, required this.selectCategory});
  final CategoriesModel categoriesModel;
  final void Function() selectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCategory,

      splashColor:
          Theme.of(context).primaryColor, //when your tap color wil chnage
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            categoriesModel.color.withOpacity(.55),
            categoriesModel.color.withOpacity(.9),
          ], begin: Alignment.topLeft, end: Alignment.topRight),
        ),
        child: Text(
          categoriesModel.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
