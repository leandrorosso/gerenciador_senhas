import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/models/login.dart';
import 'package:gerenciador_senhas/screens/home/home_screen.dart';
import 'package:gerenciador_senhas/services/login_service.dart';

class CadastrarLoginScreen extends StatefulWidget {
  const CadastrarLoginScreen({Key? key}) : super(key: key);

  @override
  _CadastrarLoginScreenState createState() => _CadastrarLoginScreenState();
}

class _CadastrarLoginScreenState extends State<CadastrarLoginScreen> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _usernameController = TextEditingController();
  final _urlController = TextEditingController();
  LoginService ls = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _tituloController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Titulo"),
                ),
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                TextFormField(
                  controller: _descricaoController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Descrição"),
                ),
                TextFormField(
                  controller: _senhaController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "Senha"),
                ),
                TextFormField(
                  controller: _urlController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: "URL"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                      ),
                      onPressed: () {
                        Login novoLogin = Login(
                          titulo: _tituloController.text,
                          descricao: _descricaoController.text,
                          senha: _senhaController.text,
                          username: _usernameController.text,
                          url: _urlController.text,
                        );
                        ls.addLogin(novoLogin, _senhaController.text);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      },
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
