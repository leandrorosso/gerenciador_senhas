import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/models/login.dart';
import 'package:gerenciador_senhas/screens/home/home_screen.dart';
import 'package:gerenciador_senhas/services/login_service.dart';
import 'package:gerenciador_senhas/utils/secure_storage_util.dart';

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
  late Future<String> _loadSenha;
  late String _senha;
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
          _senha = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text("Cadastrar Login"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _tituloController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Titulo"),
                      ),
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Username"),
                      ),
                      TextFormField(
                        controller: _descricaoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Descrição"),
                      ),
                      TextFormField(
                        controller: _senhaController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Senha"),
                      ),
                      TextFormField(
                        controller: _urlController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "URL"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Login novoLogin = Login(
                                titulo: _tituloController.text,
                                descricao: _descricaoController.text,
                                senha: _senhaController.text,
                                username: _usernameController.text,
                                url: _urlController.text,
                              );
                              ls.addLogin(novoLogin, _senha);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()));
                            },
                            child: Text(
                              "Cadastrar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<String> _getSenha() async {
    return await ss.getData('senha');
  }
}
