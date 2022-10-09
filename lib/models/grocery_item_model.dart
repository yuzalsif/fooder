import 'package:flutter/painting.dart';


enum Importance {
  low,
  medium,
  high,
}

class GroceryItem {
  
  final String id;
  final String title;
  final Importance importance;
  final DateTime date;
  final int quantity;
  final Color color;
  final bool isComplete;

  GroceryItem({
    required this.id,
    required this.title,
    required this.importance,
    required this.date,
    required this.quantity,
    required this.color,
    this.isComplete = false,
  });

  GroceryItem copyWith({
  String? id,
  String? title,
  Importance? importance,
  DateTime? date,
  int? quantity,
  Color? color,
  bool? isComplete,
  }) {
    return GroceryItem(
      id: id ?? this.id,
      title: title ?? this.title,
      importance: importance ?? this.importance,
      date: date ?? this.date,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      isComplete: isComplete ?? this.isComplete,
    );
}
}