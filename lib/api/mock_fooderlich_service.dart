import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class MockFooderLichService {
  Future<ExploreData> getExploreData() async {
    final todayRecipe = await _getTodayRecipe();
    final friendPost = await _getFriendPost();

    return ExploreData(todayRecipe: todayRecipe, friendPost: friendPost);
  }

  Future<List<SampleExplore>> _getTodayRecipe() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    final dataSring = 
    await _loadAsset('assets/sample_data/sample_explore_recipe.json');

    final Map<String, dynamic> json = jsonDecode(dataSring);

    if (json['recipes'] != null){
      final todaySampleExploreRecipes = <SampleExplore>[];
      json['recipes'].forEach((v){
        todaySampleExploreRecipes.add(SampleExplore.fromJson(v));
      });
      return todaySampleExploreRecipes;
    }else{
      return [];
    }
  }
  
  Future<List<Post>> _getFriendPost() async {
    await Future.delayed(const Duration(microseconds: 1000));

    final dataString =
    await _loadAsset('assets/sample_data/sample_friends_field.json');

    final Map<String, dynamic> json = jsonDecode(dataString);
    
    if (json['feed'] != null){
      final friendPostsData = <Post>[];
      json['feed'].forEach((v){
        friendPostsData.add(Post.fromJson(v));
      });
      return friendPostsData;
    }else{
      return [];
    }
    
  }

  Future<List<Recipe>> getSimpleRecipe() async{
    await Future.delayed(const Duration(milliseconds: 1000));

    final dataString = 
    await _loadAsset('assets/sample_data/simple_recipe.json');

    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['recipes'] != null){
      final simpleRecipes = <Recipe>[];
      json['recipes'].forEach((v){
        simpleRecipes.add(Recipe.fromJson(v));
      });
      return simpleRecipes;
    }else{
      return [];
    }
  }

  Future<String> _loadAsset(String path) async{
    return rootBundle.loadString(path);
  }
  
}
