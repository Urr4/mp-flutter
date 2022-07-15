import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../repositories/meal/meal_repository.dart';
import 'meal_preview.dart';

class MealPreviewList extends StatefulWidget {
  const MealPreviewList({Key? key}) : super(key: key);

  @override
  State<MealPreviewList> createState() => _MealPreviewListState();
}

class _MealPreviewListState extends State<MealPreviewList> {

  late Future<List<Meal>> futureMeals;

  @override
  void initState() {
    super.initState();
    futureMeals = MealRepository().fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Meal>>(
      future: futureMeals,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return MealPreview(meal: snapshot.data!.elementAt(index));
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
