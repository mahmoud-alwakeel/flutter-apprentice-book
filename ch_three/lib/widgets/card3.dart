import 'dart:developer';

import 'package:ch_two/fooderlich_theme.dart';
import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          image: DecorationImage(
            image: AssetImage('assets/mag2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Recipe Trends',
                    style: FooderlichTheme.darkTextTheme.headlineMedium,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        Chip(
                          label: Text(
                            'Healthy',
                            style: FooderlichTheme.darkTextTheme.bodySmall,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            log('delete');
                          },
                        ),
                        Chip(
                          label: Text(
                            'Vegan',
                            style: FooderlichTheme.darkTextTheme.bodySmall,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            log('delete');
                          },
                        ),
                        Chip(
                          label: Text(
                            'Carrot',
                            style: FooderlichTheme.darkTextTheme.bodySmall,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                        Chip(
                          label: Text(
                            'Carrot',
                            style: FooderlichTheme.darkTextTheme.bodySmall,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
