import 'package:flutter/material.dart';
import 'package:gerenciador_senhas/models/login.dart';
import 'package:gerenciador_senhas/screens/components/card_login.dart';
import 'package:gerenciador_senhas/screens/logins/logins_screen.dart';
import 'package:gerenciador_senhas/services/login_service.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  LoginService ls = LoginService();
  late Future<List> _loadLogins;
  late List<Login> _logins;

  @override
  void initState() {
    _loadLogins = _getLogins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 16, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Últimos logins cadastrados',
                    style: Theme.of(context).textTheme.bodyText1),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => LoginsScreen()),
                    );
                  },
                  child: Text(
                    'ver todos',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: _loadLogins,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                _logins = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: _logins.length > 8 ? 8 : _logins.length,
                    itemBuilder: (context, index) {
                      return cardLogin(context, index, _logins[index]);
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }

  Future<List> _getLogins() async {
    return await ls.getAllLogin();
  }
}
