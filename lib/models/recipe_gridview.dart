import 'package:flutter/material.dart';
import './models.dart';
import 'package:fooderlich/components/components.dart';

class RecipeGridView extends StatelessWidget {
  const RecipeGridView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: recipes.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) {
          final recipe = recipes[index];
          return Thumbnail(recipe: recipe);
        }),
      ),
    );
  }
}
