import 'package:flutter/material.dart';

import '../repositories/meal_repository.dart';

class MealPreview extends StatefulWidget {
  const MealPreview({
    Key? key,
    required this.meal
  }) : super(key: key);

  final Meal meal;

  @override
  State<MealPreview> createState() => _MealPreviewState();
}

class _MealPreviewState extends State<MealPreview> {
  @override
  Widget build(BuildContext context) {
    final _isFavorite = widget.meal.id != null;
    return Center(
        child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Image.asset(
                          'images/generic_meal.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                    ),
                    Flexible(
                        child: ListTile(
                          title: Text(widget.meal.name, style: DefaultTextStyle
                              .of(context)
                              .style
                              .apply(fontSizeFactor: 1.5)),
                          trailing: IconButton(
                              onPressed: _isFavorite? () => _saveMeal(widget.meal): () => {},
                              icon: Icon(
                                  _isFavorite ? Icons.favorite_border : Icons
                                      .favorite),
                              color: Colors.red),
                        )
                    ),
                  ],
                )
              ],
            )
        )
    );
  }

  Future<void> _saveMeal(Meal meal) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Give some more information for this meal", style: DefaultTextStyle
                .of(context)
                .style
                .apply(fontSizeFactor: 2)),
            children: [
              Text(meal.name),
              Text(meal.name),
              Text(meal.name),
              Padding(
                  padding: const EdgeInsets.only(left:10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), minimumSize: Size(80, 50)),
                    onPressed: () {},
                    child: const Text('Generate Shopping-List'),
                  )
              ),
            ],
          );
        });
  }
}
