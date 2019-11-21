import 'package:flutter/material.dart';
import 'package:meal_app/routes/route_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Foodies',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Raleway-Bold',
      ),
      home: MyHomePage(title: 'Foodies'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return TabRoute();
  }
}
