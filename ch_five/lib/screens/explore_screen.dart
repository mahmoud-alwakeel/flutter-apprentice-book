import 'dart:developer';

import 'package:ch_five/api/mock_fooderlich_service.dart';
import 'package:ch_five/components/components.dart';
import 'package:ch_five/components/today_recipe_list_view.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController controller;

  void scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent && !controller.position.outOfRange) {
      log('i am at the bottom');
    } if (controller.offset <= controller.position.minScrollExtent && !controller.position.outOfRange) {
      log('i am at the top');
    }
  }
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            return ListView(
              controller: controller,
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
