import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/screens/home/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.redAccent),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.red, foregroundColor: Colors.white),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          headline1: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
          headline3: TextStyle(
              fontSize: 12,
              color: Colors.redAccent,
              fontWeight: FontWeight.w700),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
