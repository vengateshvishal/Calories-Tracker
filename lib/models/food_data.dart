import 'dart:convert';
import 'package:flutter/services.dart';

class FoodData {
  final String foodName;
  final num calories;
  final num proteins;
  final num fats;
  final num carbs;
  final String serving_size;

  FoodData({
    required this.foodName,
    required this.calories,
    required this.proteins,
    required this.fats,
    required this.carbs,
    required this.serving_size,
  });

  factory FoodData.fromJson(Map<String, dynamic> json) {
    return FoodData(
      foodName: json['food_name'],
      calories: json['calories'],
      proteins: json['proteins'],
      fats: json['fats'],
      carbs: json['carbs'],
      serving_size: json['serving_size'],
    );
  }
}

List<FoodData> allFood = [];

Future<void> loadFoodData() async {
  final String response = await rootBundle.loadString('assets/food.json');
  final Map<String, dynamic> decodedData = json.decode(response);
  final List<dynamic> data = decodedData['food_database'];
  allFood = data.map((item) => FoodData.fromJson(item)).toList();
}
