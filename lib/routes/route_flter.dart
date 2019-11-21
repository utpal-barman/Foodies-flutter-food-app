import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data/data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/drawer_widget.dart';

class FilterRoute extends StatefulWidget {
  @override
  _FilterRouteState createState() => _FilterRouteState();
}

class _FilterRouteState extends State<FilterRoute> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        drawer: DrawerWidget(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Filter your food by switching these choice",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    value: isGlutenFree,
                    title: Text("Filter Gluten"),
                    subtitle: Text("Only include gluten free meals"),
                    onChanged: (bool value) {
                      setState(() {
                        isGlutenFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: isLactoseFree,
                    title: Text("Filter Lactose"),
                    subtitle: Text("Only include lactose free meals"),
                    onChanged: (bool value) {
                      setState(() {
                        isLactoseFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: isVegan,
                    title: Text("Filter Vegan"),
                    subtitle: Text("Only include vegan meals"),
                    onChanged: (bool value) {
                      setState(() {
                        isVegan = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: isVegetarian,
                    title: Text("Filter Vegetarian"),
                    subtitle: Text("Only include vegetarian meals"),
                    onChanged: (bool value) {
                      setState(() {
                        isVegetarian = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Filter Foods"),
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: saveFilters,
                ),
              ),
            ),
          ],
        ));
  }

  void saveFilters() {
    List<Meal> filteredMeal = DUMMY_MEALS.where((meal) {
      return (meal.isGlutenFree == isGlutenFree &&
          meal.isLactoseFree == isLactoseFree &&
          meal.isVegan == isVegan &&
          meal.isVegetarian == isVegetarian);
    }).toList();
    if (filteredMeal.length > 0)
      print(filteredMeal[0].title);
    else
      print("No foods are cooked on this constraints!");
  }
}
