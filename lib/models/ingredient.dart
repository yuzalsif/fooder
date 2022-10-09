part of 'sample_explore.dart';

class Ingredient {
    Ingredient({
        required this.imageUrl,
        required this.title,
        required this.source,
    });

    String imageUrl;
    String title;
    String source;

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        imageUrl: json["imageUrl"],
        title: json["title"],
        source: json["source"],
    );
}