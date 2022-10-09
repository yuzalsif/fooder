part of 'sample_explore.dart';

class Instruction {
    Instruction({
        required this.imageUrl,
        required this.description,
        required this.durationInMinutes,
    });

    String imageUrl;
    String description;
    int durationInMinutes;

    factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        imageUrl: json["imageUrl"],
        description: json["description"],
        durationInMinutes: json["durationInMinutes"],
    );
}