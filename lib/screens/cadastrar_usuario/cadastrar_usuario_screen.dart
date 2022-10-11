import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/models/usuario.dart';
import 'package:gerenciador_senhas/screens/home/home_screen.dart';
import 'package:gerenciador_senhas/services/usuario_service.dart';

class CadastrarUsuarioScreen extends StatelessWidget {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  UsuarioService us = UsuarioService();

  @override
  Widget build(BuildContext context) {
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
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.black12),
                            child: TextField(
                              controller: _nomeController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Nome'),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            margin: EdgeInsets.only(top: 32),
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.black12),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Email'),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
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
                      Usuario novoUsuario = Usuario(
                          nome: _nomeController.text,
                          email: _emailController.text,
                          senha: _senhaController.text);
                      us.addUsuario(novoUsuario);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Text("Cadastrar Usuário"),
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
  }
}
