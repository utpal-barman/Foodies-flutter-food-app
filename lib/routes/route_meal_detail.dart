import 'package:flutter/material.dart';
import 'package:meal_app/data/data.dart';

class MealDetailRoute extends StatelessWidget {
  final String id;

  MealDetailRoute(this.id);

  @override
  Widget build(BuildContext context) {
    final selectedMeal = DUMMY_MEALS.firstWhere((item) => item.id.contains(id));
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Detail"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(selectedMeal.imageUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      selectedMeal.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        SizedBox(
                          width: 10,
                        ),
                        Text(selectedMeal.duration.toString() + " minutes"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 10,
                        ),
                        Text(selectedMeal.affordability.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ingredients",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      spacing: 10.0,
                      children: <Widget>[
                        ...selectedMeal.ingredients.map((item) => Chip(
                              backgroundColor: Colors.amber,
                              label: Text(item),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Steps",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ...selectedMeal.steps
                        .map(
                          (item) => Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.check),
                                title: Text(item),
                              ),
                              Divider(),
                            ],
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
