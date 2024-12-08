import 'package:ch_five/api/mock_fooderlich_service.dart';
import 'package:ch_five/components/components.dart';
import 'package:ch_five/components/today_recipe_list_view.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                TodayRecipeListView(recipes: snapShot.data?.todayRecipes ?? []),
                FriendPostListView(friendsPosts: snapShot.data?.friendPosts ?? []),
                const SizedBox(height: 16),
                Container(
                  height: 400,
                  color: Colors.grey,
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
