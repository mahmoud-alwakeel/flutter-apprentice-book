import 'package:ch_two/widgets/circle_image.dart';
import 'package:ch_two/fooderlich_theme.dart';
import 'package:flutter/material.dart';

class AuthorCard extends StatefulWidget {
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
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(imageRadius: 28, imageProvider: widget.imageProvider!),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headlineMedium,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
              });
              const snackBar = SnackBar(
                content: Text('Favorite Added'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(_isFavorited? Icons.favorite : Icons.favorite_border, color: Colors.red[400],),
          ),
        ],
      ),
    );
  }
}
