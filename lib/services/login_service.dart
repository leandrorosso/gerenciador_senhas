import 'package:gerenciador_senhas/models/login.dart';
import 'package:gerenciador_senhas/utils/db_util.dart';

class LoginService {
  List<Login> _loginList = [];

  void addLogin(Login login, String senhaUsuario) async {
    final novoLogin = Login(
        id: login.id,
        titulo: login.titulo,
        descricao: login.descricao,
        username: login.username,
        url: login.url,
        senha: senhaUsuario);
    DbUtil.insertData('login', novoLogin.toMap());
  }

  Future<List> getAllLogin() async {
    final dataList = await DbUtil.getData('login');
    _loginList = dataList.map((logins) => Login.fromMap(logins)).toList();
    return _loginList;
  }
}
