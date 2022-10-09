import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../models/models.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({Key? key}) : super(key: key);

  final mockService = MockFooderLichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getSimpleRecipe(),
      builder: (context, AsyncSnapshot<List<Recipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipeGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
