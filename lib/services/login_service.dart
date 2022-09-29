import 'package:gerenciador_senhas/models/login.dart';
import 'package:gerenciador_senhas/utils/db_util.dart';

class LoginService {
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
}
