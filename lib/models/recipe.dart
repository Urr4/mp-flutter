class Recipe {
  String? id;
  final String name;
  final String recipeType;
  final String instructions;

  Recipe({this.id, required this.name, required this.recipeType, required this.instructions});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json["id"],
      name: json["name"],
      recipeType: json["recipeType"],
      instructions: json["instructions"],
    );
  }

  Map toJson(){
    return {
      "id": id,
      "name": name,
      "recipeType": recipeType,
      "instructions": instructions
    };
  }
}