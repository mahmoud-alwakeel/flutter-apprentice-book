class Recipe {
  String label;
  String imageUrl;
  int servings;
  List<Ingredients> ingredients;

  Recipe(
    this.label,
    this.imageUrl,
    this.servings,
    this.ingredients,
  );

  static List<Recipe> samples = [
    Recipe(
      'spaghetti',
      'assets/img_one.jpg',
      4,
      [
        Ingredients(1, 'box', 'spaghetti'),
        Ingredients(1, 'box', 'spaghetti'),
        Ingredients(1, 'box', 'spaghetti'),
      ],
    ),
    Recipe(
      'tomato',
      'assets/img_two.jpg',
      4,
      [
        Ingredients(1, 'box', 'spaghetti'),
      ],
    ),
    Recipe(
      'cheese',
      'assets/img_three.jpg',
      4,
      [
        Ingredients(1, 'box', 'spaghetti'),
      ],
    ),
    Recipe(
      'chocolate',
      'assets/img_four.jpg',
      4,
      [
        Ingredients(1, 'box', 'spaghetti'),
      ],
    ),
  ];
}

class Ingredients {
  double quantity;
  String measure;
  String name;
  Ingredients(
    this.quantity,
    this.measure,
    this.name,
  );
}
