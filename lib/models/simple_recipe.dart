class Recipe {
    Recipe({
       required this.id,
       required this.dishImage,
       required this.title,
       required this.duration,
       required this.source,
       required this.information,
    });

    String id;
    String dishImage;
    String title;
    String duration;
    String source;
    List<String> information;

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"] ?? '',
        dishImage: json["dishImage"] ?? '',
        title: json["title"] ?? '',
        duration: json["duration"] ?? '',
        source: json["source"] ?? '',
        information: List<String>.from(json["information"].map((x) => x)),
    );
}
