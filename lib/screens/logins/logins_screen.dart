import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/screens/components/float_action_button.dart';
import 'package:gerenciador_senhas/screens/logins/components/body.dart';

class LoginsScreen extends StatefulWidget {
  @override
  _LoginsScreenState createState() => _LoginsScreenState();
}

class _LoginsScreenState extends State<LoginsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: buildFloatActionButton(context),
      appBar: AppBar(
        title: const Text("Controle Senhas"),
        backgroundColor: Colors.red,
      ),
    );
  }
}
