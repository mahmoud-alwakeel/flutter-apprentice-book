import 'package:ch_five/components/components.dart';
import 'package:ch_five/models/explore_recipe.dart';
import 'package:flutter/material.dart';

class TodayRecipeListView extends StatelessWidget {
  const TodayRecipeListView({super.key, required this.recipes});
  final List<ExploreRecipe> recipes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              separatorBuilder: (context, index) => SizedBox(width: 16),
              itemCount: recipes.length,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card1(recipe: recipe);
    } else {
      throw Exception('This card doesn\t exist yet');
    }
  }
}
