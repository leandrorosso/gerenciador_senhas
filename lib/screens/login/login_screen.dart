import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerenciador_senhas/models/login.dart';
import 'package:gerenciador_senhas/screens/home/home_screen.dart';
import 'package:gerenciador_senhas/services/login_service.dart';
import 'package:gerenciador_senhas/utils/secure_storage_util.dart';

class LoginScreen extends StatefulWidget {
  int? idLogin;
  String? senhaUsuario;

  LoginScreen({this.idLogin, this.senhaUsuario});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginService ls = LoginService();
  late Future<Login> _loadLogin;
  late Login _login;

  @override
  void initState() {
    // TODO: implement initState
    _loadLogin = _getLogin(widget.idLogin!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadLogin,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _login = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text("Dados do Login"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        enabled: false,
                        initialValue: _login.titulo,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Titulo"),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: _login.username,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Username"),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: _login.descricao,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Descrição"),
                      ),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: _login.senha));
                          alertDialog(context);
                        },
                        child: TextFormField(
                          enabled: false,
                          initialValue: _login.senha,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Senha"),
                        ),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: _login.url,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "URL"),
                      ),
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

  Future<Login> _getLogin(int id) async {
    return await ls.getLogin(id, widget.senhaUsuario!);
  }

  alertDialog(BuildContext context) {
    Widget ok = FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("OK"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Senha copiada com sucesso"),
            actions: [
              ok,
            ],
          );
        });
  }
}
