
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../repositories/meal/meal_repository.dart';

class SaveMealDialog extends StatefulWidget {
  const SaveMealDialog({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  State<SaveMealDialog> createState() => _SaveMealDialogState();
}

class _SaveMealDialogState extends State<SaveMealDialog> {

  String? userInputMealName;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Give some more information for this meal",
          style: DefaultTextStyle.of(context)
              .style
              .apply(fontSizeFactor: 2)),
      children: [
        Padding(
          padding: const EdgeInsets.only(top:10, bottom: 10, left: 30, right: 30),
          child: TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter a name for the meal',
            ),
            onChanged: (text)=>{
              setState(() {
                userInputMealName = text;
              })
            },
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top:10, bottom: 10, left: 30, right: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(80, 50)),
              onPressed: ()=> _saveMeal(widget.meal, userInputMealName!),
              child: const Text('Save'),
            )),
      ],
    );
  }

  void _saveMeal(Meal meal, String mealName) {
    debugPrint("Saving meal $meal with name $mealName");
    MealRepository().saveMeal(mealName, meal.recipes.map((r) => r.id!).toList());
    Navigator.of(context).pop();
  }
}
