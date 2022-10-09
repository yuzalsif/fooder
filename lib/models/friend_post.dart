class Post{
    Post({
        required this.id,
        required this.profileImageUrl,
        required this.comment,
        required this.foodPictureUrl,
        required this.timestamp,
    });

    String id;
    String profileImageUrl;
    String comment;
    String foodPictureUrl;
    String timestamp;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"] ?? '',
        profileImageUrl: json["profileImageUrl"] ?? '',
        comment: json["comment"] ?? '',
        foodPictureUrl: json["foodPictureUrl"] ?? '',
        timestamp: json["timestamp"] ?? '',
    );

}
