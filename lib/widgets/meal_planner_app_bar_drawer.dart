import 'package:flutter/material.dart';
import 'package:mp_flutter/meal_page.dart';

import '../recipe_page.dart';

class MealPlannerAppBarDrawer extends StatelessWidget {
  const MealPlannerAppBarDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left:10, right: 10),
                      child: Icon(Icons.account_tree_outlined, color: Colors.white),
                    ),
                    Text(
                      'Navigation',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ]
              )
          ),
          ListTile(
            title: const Text('Meals', style: TextStyle(fontSize: 15)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MealPage()));
            },
          ),
          ListTile(
            title: const Text('Recipes', style: TextStyle(fontSize: 15)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipePage()));
            },
          ),
        ],
      ),
    );
  }
}