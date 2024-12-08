import 'package:ch_five/components/components.dart';
import 'package:ch_five/models/simple_recipe.dart';
import 'package:flutter/material.dart';

class RecipeGridView extends StatelessWidget {
  const RecipeGridView({super.key, required this.recipes});

  final List<SimpleRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
          itemCount: recipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final simpleRecipe = recipes[index];
            return RecipeThumbnail(recipe: simpleRecipe);
          }),
    );
  }
}
