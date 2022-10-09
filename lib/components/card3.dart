import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  final SampleExplore exploreRecipe;

  const Card3({
    Key? key,
    required this.exploreRecipe,
  }) : super(key: key);

  List<Widget> makeChip() {
    final chips = <Widget>[];
    exploreRecipe.tags.take(6).forEach(
      (element) {
        final chip = Chip(
          label: Text(
            element,
            style: FooderLichTheme.darkTextTheme.bodyText1,
          ),
          backgroundColor: Colors.black.withOpacity(0.7),
        );
        chips.add(chip);
      },
    );
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
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
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      exploreRecipe.title,
                      style: FooderLichTheme.darkTextTheme.headline2,
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ]),
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                children: makeChip(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
