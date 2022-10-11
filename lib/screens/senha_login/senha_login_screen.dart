import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/screens/login/login_screen.dart';
import 'package:gerenciador_senhas/utils/secure_storage_util.dart';

class SenhaLoginScreen extends StatefulWidget {
  int? idLogin;

  SenhaLoginScreen({this.idLogin});

  @override
  _SenhaLoginScreenState createState() => _SenhaLoginScreenState();
}

class _SenhaLoginScreenState extends State<SenhaLoginScreen> {
  final _senhaController = TextEditingController();
  SecureStorageUtil ss = SecureStorageUtil();
  late Future<String> _loadSenha;
  late String _senha;

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
            body: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2.5,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(90),
                                  bottomRight: Radius.circular(90),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.enhanced_encryption_rounded,
                                    size: 90,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 62),
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 45,
                                  margin: EdgeInsets.only(top: 32),
                                  padding: EdgeInsets.only(
                                      top: 4, left: 16, right: 16, bottom: 4),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Colors.black12),
                                  child: TextField(
                                    controller: _senhaController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(
                                          Icons.enhanced_encryption_rounded,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Senha'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () {
                            if (_senha == _senhaController.text) {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (_) => LoginScreen(
                                            idLogin: widget.idLogin,
                                            senhaUsuario: _senha,
                                          )));
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (_) => SenhaLoginScreen(
                                            idLogin: widget.idLogin,
                                          )));
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                              child: Text("Acessar Login"),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
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
