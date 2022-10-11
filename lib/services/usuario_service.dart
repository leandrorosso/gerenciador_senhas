import 'package:gerenciador_senhas/models/usuario.dart';
import 'package:gerenciador_senhas/utils/secure_storage_util.dart';

class UsuarioService {
  final SecureStorageUtil ss = SecureStorageUtil();

  void addUsuario(Usuario usuario) async {
    ss.insertData('nome', usuario.nome!);
    ss.insertData('email', usuario.email!);
    ss.insertData('senha', usuario.senha!);
  }
}
