import 'package:gerenciador_senhas/models/login.dart';
import 'package:gerenciador_senhas/utils/db_util.dart';
import 'package:gerenciador_senhas/utils/encrypt_util.dart';

class LoginService {
  List<Login> _loginList = [];
  EncryptUtil en = EncryptUtil();

  void addLogin(Login login, String senhaUsuario) async {
    var senhaCriptografada = await en.encryptString(login.senha!, senhaUsuario);
    print(senhaCriptografada);
    final novoLogin = Login(
        id: login.id,
        titulo: login.titulo,
        descricao: login.descricao,
        username: login.username,
        url: login.url,
        senha: senhaCriptografada);
    DbUtil.insertData('login', novoLogin.toMap());
  }

  Future<List> getAllLogin() async {
    final dataList = await DbUtil.getData('login');
    _loginList = dataList.map((logins) => Login.fromMap(logins)).toList();
    return _loginList;
  }

  Future<Login> getLogin(int id, String senhaUsuario) async {
    String whereString = "id = ?";
    List<dynamic> whereArgument = [id];
    final dataList =
        await DbUtil.getDataId('login', whereString, whereArgument);
    String senhaDescriptografada =
        await en.decryptString(dataList.first["senha"], senhaUsuario);

    return Login(
        id: dataList.first["id"],
        titulo: dataList.first["titulo"],
        descricao: dataList.first["descricao"],
        username: dataList.first["username"],
        url: dataList.first["url"],
        senha: senhaDescriptografada);
  }
}
