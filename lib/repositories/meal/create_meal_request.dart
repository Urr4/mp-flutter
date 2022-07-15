class CreateMealRequest {
  final String mealName;
  final List<String> recipeIds;

  CreateMealRequest({required this.mealName, required this.recipeIds});

  Map toJson() {
    return {"mealName": mealName, "recipeIds": recipeIds};
  }

}