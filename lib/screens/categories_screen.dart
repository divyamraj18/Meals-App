import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    catData.title,
                    catData.color,
                    catData.id,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
    );
  }
}
