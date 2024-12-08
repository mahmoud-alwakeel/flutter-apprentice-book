import 'package:ch_five/components/components.dart';
import 'package:ch_five/models/post.dart';
import 'package:flutter/material.dart';

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({super.key, required this.friendsPosts});
  final List<Post> friendsPosts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social chefs',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = friendsPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: friendsPosts.length,
          )
        ],
      ),
    );
  }
}
