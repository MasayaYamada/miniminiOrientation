import 'package:flutter/material.dart';
import 'package:mini_orientailing/top.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              button: TextStyle(color: Colors.white),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Top(),
      },
    );
  }
}
