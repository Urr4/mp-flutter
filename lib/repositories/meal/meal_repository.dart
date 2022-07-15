import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mp_flutter/repositories/meal/create_meal_request.dart';

import '../../models/meal.dart';

class MealRepository {
  Future<List<Meal>> fetchMeals() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/api/meals'));

    Iterable it = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      List<Meal> meals = List<Meal>.from(it.map((json) => Meal.fromJson(json)));
      return meals;
    } else {
      throw Exception("Failed to fetch meals");
    }
  }

  Future<void> saveMeal(String mealName, List<String> recipeIds) async {

    CreateMealRequest createMealRequest = CreateMealRequest(mealName: mealName, recipeIds: recipeIds);

    final response = await http
        .post(
          Uri.parse('http://localhost:8080/api/meals'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(createMealRequest.toJson())
        );

    if (response.statusCode != 200) {
      throw Exception("Failed to save meal");
    }
  }
}


