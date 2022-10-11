
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class EncryptUtil {
  String encryptString(String senhaLogin, String senhaUsuario) {
    final encoded = utf8.encode(senhaUsuario);
    var md5Convert = md5.convert(encoded);
    final key = Key.fromUtf8(md5Convert.toString());
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(senhaLogin, iv: iv);
    return encrypted.base64;
  }

  String decryptString(String senhaLogin, String senhaUsuario) {
    final encoded = utf8.encode(senhaUsuario);
    var md5Convert = md5.convert(encoded);
    final key = Key.fromUtf8(md5Convert.toString());
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));
    final encrypted = Encrypted.fromBase64(senhaLogin.toString());
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}