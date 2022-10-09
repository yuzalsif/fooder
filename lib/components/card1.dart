import 'package:flutter/material.dart';
import '../fooderlich_theme.dart';
import '../models/models.dart';

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,
    required this.exploreRecipe,
  }) : super(key: key);
  
  final SampleExplore exploreRecipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(children: [
          Text(
            exploreRecipe.subtitle,
            style: FooderLichTheme.darkTextTheme.bodyText1,
          ),
          Positioned(
            child: Text(
              exploreRecipe.title,
              style: FooderLichTheme.darkTextTheme.headline2,
            ),
            top: 20,
          ),
          Positioned(
            child: Text(
              exploreRecipe.title,
              style: FooderLichTheme.darkTextTheme.headline2,
            ),
            top: 20,
          ),
          Positioned(
            child: Text(
              exploreRecipe.authorName,
              style: FooderLichTheme.darkTextTheme.bodyText1,
            ),
            bottom: 10,
            right: 0,
          ),
        ]),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(exploreRecipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
