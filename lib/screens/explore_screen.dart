import 'package:flutter/material.dart';
import 'package:fooderlich/models/friend_post_listview.dart';
import '../api/mock_fooderlich_service.dart';
import '../models/models.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  final mockService = MockFooderLichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(
                exploreRecipe: snapshot.data?.todayRecipe ?? [],
              ),
              const SizedBox(
                height: 10,
              ),
              FriendPostListView(
                friendPost: snapshot.data?.friendPost ?? [],
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
