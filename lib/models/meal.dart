import 'recipe.dart';

class Meal {
  String? id;
  final bool isGenerated;
  final String name;
  final List<Recipe> recipes;

  Meal(
      {this.id,
      required this.isGenerated,
      required this.name,
      required this.recipes});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
        id: json["id"],
        isGenerated: json["generated"],
        name: json["name"],
        recipes: List<Recipe>.from(
            json["recipes"].map((json) => Recipe.fromJson(json))));
  }

  Map toJson() {
    List<Map> recipes = this.recipes.map((r) => r.toJson()).toList();
    return {"id": id, "name": name, "recipes": recipes};
  }
}
