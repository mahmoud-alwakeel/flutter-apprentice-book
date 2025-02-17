import 'package:ch_five/api/mock_fooderlich_service.dart';
import 'package:ch_five/components/components.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({super.key});

  final exploreService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            ///Todo
            // return Center(child: Text('Recipes screen'),);
            return RecipeGridView(recipes: snapShot.data ?? []);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
