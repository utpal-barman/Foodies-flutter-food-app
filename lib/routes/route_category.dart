import 'package:flutter/material.dart';
import '../widgets/single_category.dart';
import '../data/data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 4 / 3,
        ),
        children: DUMMY_CATEGORIES
            .map((item) => SingleCategory(item.id, item.title, item.color))
            .toList(),
      ),
    );
  }
}
