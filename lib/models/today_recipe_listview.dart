import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<SampleExplore> exploreRecipe;

  const TodayRecipeListView({
    Key? key,
    required this.exploreRecipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day \u{1F373}',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 400,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  final post = exploreRecipe[index];
                  return cardBuilder(post);
                }),
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                }),
                itemCount: exploreRecipe.length),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget cardBuilder(SampleExplore post) {
    if (post.cardType == RecipeCardType.card1) {
      return Card1(exploreRecipe: post);
    } else if (post.cardType == RecipeCardType.card2) {
      return Card2(exploreRecipe: post);
    } else if (post.cardType == RecipeCardType.card3) {
      return Card3(exploreRecipe: post);
    } else {
      throw Exception('Card not available');
    }
  }
}
