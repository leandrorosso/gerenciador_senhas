import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/screens/cadastrar_usuario/cadastrar_usuario_screen.dart';
import 'package:gerenciador_senhas/screens/home/home_screen.dart';
import 'package:gerenciador_senhas/utils/secure_storage_util.dart';

class PaginaInicialScreen extends StatefulWidget {
  @override
  _PaginaInicialScreenState createState() => _PaginaInicialScreenState();
}

class _PaginaInicialScreenState extends State<PaginaInicialScreen> {
  late Future<String?> _loadSenha;
  SecureStorageUtil ss = SecureStorageUtil();

  @override
  void initState() {
    // TODO: implement initState
    _loadSenha = _getSenha();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadSenha,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return CadastrarUsuarioScreen();
          }
        });
  }

  Future<String?> _getSenha() async {
    return await ss.getData('senha');
  }
}
