import 'package:flutter/material.dart';
import 'package:meal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  initState()  {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
      super.initState();
  }
  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      inactiveThumbColor: Colors.amber,
      activeColor: Colors.red,
      activeTrackColor: Colors.green,
      inactiveTrackColor: Colors.black38,
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: (){
                  final selectedFilters={
                    'gluten':_glutenFree,
                    'lactose':_lactoseFree,
                    'vegan':_vegan,
                    'vegetarian':_vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal Selection here...',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(

                child: ListView(
              children: <Widget>[
                buildSwitchListTile('Gluteen-Free',
                    'Only Include Gluteen Free Meals',
                    _glutenFree,

                        (newValue) {
                  setState(() {
                    _glutenFree=newValue;
                  });
                }),
                buildSwitchListTile('Lactose-Free',
                    'Only Include Lactose Free Meals',
                    _lactoseFree,
                        (newValue) {
                      setState(() {
                        _lactoseFree=newValue;
                      });
                    }),
                buildSwitchListTile('vegetarian',
                    'Only Include veg Meals',
                    _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian=newValue;
                      });
                    }),
                buildSwitchListTile('vegan',
                    'Only Include Vegan Meals',
                    _vegan,
                        (newValue) {
                      setState(() {
                        _vegan=newValue;
                      });
                    })
              ],
            ))
          ],
        ));
  }
}
