import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/model/meal.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/category_meals_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import 'package:meal/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favouriteMeals=[];
  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;
      // ignore: missing_return
      _availableMeals=DUMMY_MEALS.where((meal){
        if(_filters['gluten']&&!meal.isGlutenFree) {
          return false;
        }
        if(_filters['lactose']&&!meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegan']&&!meal.isVegan) {
          return false;
        }
        if(_filters['vegetarian']&&!meal.isVegetarian) {
          return false;
        }
        return true;

      }).toList();
    });
  }
  void _toggleFavorite(String mealId){
    final existingIndex =_favouriteMeals.indexWhere((meal)=>meal.id==mealId);
    if(existingIndex>=0)
      {
        setState(() {
          _favouriteMeals.removeAt(existingIndex);
        });
      }
    else{
      setState(() {
        _favouriteMeals.add(
            DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId),
        );
      });

    }
  }
  bool isMealFavorite(String id){
    return _favouriteMeals.any((meal)=>meal.id==id);


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DesiMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx)=>TabsScreen(_favouriteMeals),
        '/category-meals': (ctx)=>CategoryMealsScreen(_availableMeals),
        '/meal-detail':(ctx)=>MealDetailScreen(_toggleFavorite,isMealFavorite),
        '/filters-screen':(ctx)=>FiltersScreen(_filters,_setFilters),
      },
    );
  }
}
