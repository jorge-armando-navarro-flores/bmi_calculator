import 'package:flutter/material.dart';
import 'screens/input_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22),
        scaffoldBackgroundColor: Color(0xFF090C21),

      ),
      initialRoute: "/",
      routes: {
        "/": (context) => InputPage(),

      },
    );
  }
}

