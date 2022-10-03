class Login {
  int? id;
  String? titulo, descricao, senha, username, url;

  Login(
      {this.id,
      this.titulo,
      this.descricao,
      this.senha,
      this.username,
      this.url});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'senha': senha,
      'username': username,
      'url': url
    };
  }

  Login.fromMap(Map map) {
    id = map['id'];
    titulo = map['titulo'];
    descricao = map['descricao'];
    senha = map['senha'];
    username = map['username'];
    url = map['url'];
  }
}
