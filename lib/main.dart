// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:azkar/screen/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 24, 71, 102),
            centerTitle: true,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white),
    );
  }
}
