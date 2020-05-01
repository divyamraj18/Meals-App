import 'package:flutter/material.dart';
import 'package:meal/model/meal.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/favorites_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    // TODO: implement initState
    _pages=[
      {
        'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavoritesScreen(widget.favouriteMeals),
        'title': 'Favourites'
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          backgroundColor: Theme.of(context).primaryColor,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text('Favourites'),
            )
          ]),
    );
  }
}
