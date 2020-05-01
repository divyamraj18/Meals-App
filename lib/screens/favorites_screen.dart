import 'package:flutter/material.dart';
import 'package:meal/model/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('no favorite meal added till now'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            affordability:favoriteMeals[index].affordability ,
            imageUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].complexity,
            duration:favoriteMeals [index].duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
