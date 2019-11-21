import 'package:flutter/material.dart';
import 'package:meal_app/routes/route_meal_detail.dart';
import '../data/data.dart';

class MealList extends StatelessWidget {
  final String foodCategoryTitle;
  final String catId;

  const MealList(this.foodCategoryTitle, this.catId);

  @override
  Widget build(BuildContext context) {
    final mealNameList =
        DUMMY_MEALS.where((each) => each.categories.contains(catId)).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(foodCategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return MealDetailRoute(mealNameList[index].id);
              }));
            },
            child: Column(children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(mealNameList[index].imageUrl),
                ),
                title: Text(mealNameList[index].title),
                subtitle:
                    Text(mealNameList[index].duration.toString() + " minutes"),
                trailing: IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ),
              Image.network(mealNameList[index].imageUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(width: 10),
                        Text(mealNameList[index].duration.toString() +
                            " minutes"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.assignment),
                        SizedBox(width: 10),
                        Text("Tap on food for detail"),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          );
        },
        itemCount: mealNameList.length,
      ),
    );
  }
}
