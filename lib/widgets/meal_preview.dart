import 'package:flutter/material.dart';
import 'package:mp_flutter/widgets/save_meal_dialog.dart';

import '../models/meal.dart';
import '../repositories/meal/meal_repository.dart';

class MealPreview extends StatefulWidget {
  const MealPreview({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  State<MealPreview> createState() => _MealPreviewState();
}

class _MealPreviewState extends State<MealPreview> {

  @override
  Widget build(BuildContext context) {
    final isMealGenerated = widget.meal.isGenerated;
    return ExpansionTile(
      title: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
                Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Image.asset(
                      'images/generic_meal.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )),
                Flexible(
                    child: ListTile(
                      title: Text(widget.meal.name,
                        style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 1.5)),
                      trailing: IconButton(
                        onPressed: isMealGenerated
                          ? () => _openSaveMealDialog(widget.meal)
                          : null,
                        icon: Icon(isMealGenerated ? Icons.favorite_border : Icons.favorite),
                  ),
                )),
              ],
            )
          ],
        ),
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.topLeft,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: widget.meal.recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(widget.meal.recipes.elementAt(index).name)
                  );
                }
            )
          )
        )
      ],
    );
  }

  Future<void> _openSaveMealDialog(Meal meal) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SaveMealDialog(meal: meal);
        });
  }

}
