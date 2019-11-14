import 'package:flutter/material.dart';

import './routes/route_category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[Icon(Icons.settings)],
      ),
      body: CategoriesScreen(),
    );
  }
}
