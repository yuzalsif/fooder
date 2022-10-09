import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import './author_card.dart';

class Card2 extends StatelessWidget {
  final SampleExplore exploreRecipe;

  const Card2({
    Key? key,
    required this.exploreRecipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          height: 450,
          width: 350,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(exploreRecipe.backgroundImage),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthorCard(
              imageProvider: AssetImage(exploreRecipe.authorImage),
              title: exploreRecipe.title,
              authorName: exploreRecipe.authorName,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Text(
                    exploreRecipe.subtitle,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Positioned(
                  bottom: 70,
                  left: 16,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      exploreRecipe.dietType,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
