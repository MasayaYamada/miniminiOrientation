import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_orientailing/administration/admin_game_detail.dart';
import 'package:mini_orientailing/administration/admin_home.dart';
import 'package:mini_orientailing/administration/admin_login.dart';
import 'package:mini_orientailing/administration/admin_sign_up.dart';
import 'package:mini_orientailing/top.dart';
import 'package:mini_orientailing/user_login.dart';

import 'administration/admin_add_times.dart';
import 'model/User.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  User user = new User();

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
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => Top(),
        '/userLogin': (BuildContext context) => UserLogin(),
        '/adminHome': (BuildContext context) => AdminHome(),
        '/adminLogin': (BuildContext context) => AdminLogin(),
        '/adminGameDetail': (BuildContext context) => AdminGameDetails(),
        '/adminSignUp': (BuildContext context) => AdminSignUp(),
        '/adminAddItems': (BuildContext context) => AdminAddItems(),
      },
    );
  }
}
