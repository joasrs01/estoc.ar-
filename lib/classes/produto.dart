import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Produto {
  static Future<bool> adicionarProduto(
      String nome, String descricao, double custo, File? imagem) async {
    var retorno = await FirebaseFirestore.instance.collection('produtos').add({
      'nome': nome,
      'descricao': descricao,
      'custo': custo,
      'caminha_imagem': imagem != null ? await uploadImagem(imagem) : "",
    });

    return retorno.id.isNotEmpty;
  }

  static Future<String> uploadImagem(File imagem) async {
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final nomeArquivo = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = storage.ref().child('imagem_produto/$nomeArquivo');

      await ref.putFile(imagem);
      return await ref.getDownloadURL(); // Obtém a URL da imagem
    } catch (e) {
      print("Erro ao fazer upload: $e");
      return "";
    }
  }

  static Future<List<Map<String, dynamic>>> buscarTodosProdutos() async {
    var retorno = await FirebaseFirestore.instance.collection('produtos').get();

    List<Map<String, dynamic>> oLstRetorno = [];

    for (var doc in retorno.docs) {
      oLstRetorno.add(doc.data());
    }

    return oLstRetorno;
  }
}
