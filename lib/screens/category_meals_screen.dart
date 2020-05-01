import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/model/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
//  final String id;
//  final String title;
//  CategoryMealScreen(
//      this.id,
//      this.title,
//      );
  final List<Meal> avaliableMeals;
  CategoryMealsScreen(this.avaliableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData=false;
  @override
  void initState() {
    // TODO: implement initState
    //..............
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loadedInitData) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.avaliableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId)
  {
    setState(() {
      displayedMeals.removeWhere((meal)=>meal.id==mealId);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(

        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            affordability:displayedMeals[index].affordability ,
            imageUrl: displayedMeals[index].imageUrl,
            complexity: displayedMeals[index].complexity,
            duration:displayedMeals[index].duration,
            //removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
