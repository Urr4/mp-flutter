import 'package:flutter/material.dart';

import '../repositories/meal_repository.dart';

class MealPreview extends StatefulWidget {
  const MealPreview({
    Key? key,
    required this.meal
  }) : super(key:key);

  final Meal meal;

  @override
  State<MealPreview> createState() => _MealPreviewState();
}

class _MealPreviewState extends State<MealPreview> {
  @override
  Widget build(BuildContext context) {
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
                      title: Text(widget.meal.name, style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5)),
                      trailing: const Icon(Icons.favorite_border)
                    )
                  ),
                ],
              )
            ],
          )
        )
      );
  }
}
