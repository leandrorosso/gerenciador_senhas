import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/screens/cadastrar_usuario/cadastrar_usuario_screen.dart';
import 'package:gerenciador_senhas/screens/home/home_screen.dart';
import 'package:gerenciador_senhas/screens/pagina_inicial/pagina_inicial_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.red,
          iconTheme: IconThemeData(color: Colors.white),
          buttonTheme: ButtonThemeData(buttonColor: Colors.redAccent),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.red, foregroundColor: Colors.white),
          textTheme: TextTheme(
            bodyText1: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
            headline1: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.normal),
            headline3: TextStyle(
                fontSize: 12,
                color: Colors.redAccent,
                fontWeight: FontWeight.w700),
          )),
      home: PaginaInicialScreen(),
    );
  }
}
