import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/screens/cadastrar_login/cadastrar_login_screen.dart';

FloatingActionButton buildFloatActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => CadastrarLoginScreen()),
      );
    },
    child: const Icon(Icons.add),
  );
}
