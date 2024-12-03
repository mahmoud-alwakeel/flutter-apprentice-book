import 'package:ch_two/widgets/circle_image.dart';
import 'package:ch_two/fooderlich_theme.dart';
import 'package:flutter/material.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(imageRadius: 28, imageProvider: imageProvider!),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headlineMedium,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              const snackBar = SnackBar(
                content: Text('Favorite Added'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
