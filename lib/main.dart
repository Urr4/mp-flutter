import 'package:flutter/material.dart';

import 'repositories/meal_repository.dart';
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
  late Future<List<Meal>> futureMeals;

  @override
  void initState(){
    super.initState();
    futureMeals = MealRepository().fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Planner"),
      ),
        drawer: const MealPlannerAppBarDrawer(),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  child: Text("Meal-Plan", style: TextStyle(fontSize: 20),)
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 30),
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.abc))
                )
              ],
            ),
            FutureBuilder<List<Meal>>(
              future: futureMeals,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MealPreview(meal: snapshot.data!.elementAt(index));
                      }
                  );
                }else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            )
        ]
      )
    );
  }
}