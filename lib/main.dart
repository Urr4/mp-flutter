import 'package:flutter/material.dart';
import 'package:mp_flutter/widgets/meal_preview_list.dart';

import 'models/meal.dart';
import 'repositories/meal/meal_repository.dart';
import 'widgets/meal_planner_app_bar_drawer.dart';
import 'widgets/meal_preview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MealPlannerHomepage(),
    );
  }
}

class MealPlannerHomepage extends StatefulWidget {
  const MealPlannerHomepage({Key? key}) : super(key: key);

  @override
  State<MealPlannerHomepage> createState() => _MealPlannerHomepageState();
}

class _MealPlannerHomepageState extends State<MealPlannerHomepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meal Planner"),
          actions: [
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_box_rounded)),
                const Text("Your Name")
              ],
            ))
          ],
        ),
        drawer: const MealPlannerAppBarDrawer(),
        body: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  child: Text(
                    "Meal-Plan",
                    style: TextStyle(fontSize: 20),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 30, top: 30),
                  child:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.abc)))
            ],
          ),
          const MealPreviewList(),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        minimumSize: Size(80, 50)),
                    onPressed: () {},
                    child: const Text('Generate Shopping-List'),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        minimumSize: Size(80, 50)),
                    onPressed: () {},
                    child: const Text('Randomize Meals'),
                  )),
            ],
          )
        ])));
  }
}
