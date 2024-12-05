import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telas_app/classes/ambiente.dart';

class Autenticacao {
  static String idUsuario = "";
  static String desNomeUsuario = "";
  static String desUsuario = "";

  Future<void> cadastrarUsuario(String nome, String login, String senha) async {
    try {
      var retorno =
          await FirebaseFirestore.instance.collection('usuarios').add({
        'nome': nome,
        'login': login,
        'senha': senha,
      });

      Ambiente.idUsuario = retorno.id;

      print('Usuário cadastrado com sucesso!');
    } catch (e) {
      print('Erro ao cadastrar usuário: $e');
    }
  }

  Future<bool> autenticarUsuario(String login, String senha) async {
    var oRetorno = await FirebaseFirestore.instance
        .collection('usuarios')
        .where('login', isEqualTo: login)
        .where('senha', isEqualTo: senha)
        .limit(1)
        .get();

    if (oRetorno.docs.isNotEmpty) {
      var usuario = oRetorno.docs.first.data();
      desUsuario = usuario["login"];
      desNomeUsuario = usuario["nome"];
      return true;
    } else {
      print("Usuário não encontrado.");
      return false;
    }
  }
}
