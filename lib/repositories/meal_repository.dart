import 'dart:convert';

import 'package:http/http.dart' as http;

class MealRepository {
  Future<List<Meal>> fetchMeals() async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/api/meals'));

    Iterable it = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
    List<Meal> meals = List<Meal>.from(it.map((json) => Meal.fromJson(json)));
      return meals;
    } else {
      throw Exception("Failed to fetch meals");
    }
  }
}

class Meal {
  final String id;
  final String name;

  Meal({required this.id, required this.name});

  factory Meal.fromJson(Map<String, dynamic> json){
    return Meal(
        id: json["id"],
        name: json["name"]
    );
  }
}
