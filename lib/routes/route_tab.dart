import 'package:flutter/material.dart';
import 'package:meal_app/routes/route_flter.dart';
import 'package:meal_app/widgets/drawer_widget.dart';
import './route_category.dart';
import './route_favourites.dart';

class TabRoute extends StatefulWidget {
  @override
  _TabRouteState createState() => _TabRouteState();
}

class _TabRouteState extends State<TabRoute> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text("Foodies"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return FilterRoute();
                }));
              },
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favourites",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavouriteRoute(),
          ],
        ),
        drawer: DrawerWidget(),
      ),
      length: 2,
    );
  }
}
