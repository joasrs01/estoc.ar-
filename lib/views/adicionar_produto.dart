import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:telas_app/classes/produto.dart';
import 'package:telas_app/util/util.dart';
import 'package:telas_app/views/listar_produtos.dart';

class AdicionarProduto extends StatefulWidget {
  const AdicionarProduto({super.key});

  @override
  _AdicionarProduto createState() => _AdicionarProduto();
}

class _AdicionarProduto extends State<AdicionarProduto> {
  File? oImagemSelecionada;

  // Future<File?> selecionarImagem() async {
  //   File? _imagem;
  //   final picker = ImagePicker();

  //   final arquivoSelecionado =
  //       await picker.pickImage(source: ImageSource.gallery);

  //   if (arquivoSelecionado != null) {
  //     setState(() {
  //       _imagem = File(arquivoSelecionado.path);
  //     });
  //   }

  //   return _imagem;
  // }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController custoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produto'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              print('Ícone de usuário clicado');
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 4, 57, 89),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descricaoController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Descrição do Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  //oImagemSelecionada = await selecionarImagem();
                  print('imagem selecionar');
                },
                icon: const Icon(Icons.image),
                label: const Text('Adicionar Imagem'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 57, 89),
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: custoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Custo do Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (await Produto.adicionarProduto(
                        nomeController.text,
                        descricaoController.text,
                        double.parse(custoController.text),
                        oImagemSelecionada)) {
                      Util.apresentarMensagemRodape(context,
                          "Produto ${nomeController.text} adicionado com sucesso!");
                      Navigator.pop(context);
                    } else {
                      Util.apresentarMensagemRodape(context,
                          "Não foi possível cadastrar o produto ${nomeController.text}.");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 57, 89),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  child: const Text('Registrar Produto'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color.fromARGB(255, 4, 57, 89),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListarProdutos(),
              ),
            );
          } // else if (index == 1) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const AdicionarProduto(),
          //     ),
          //   );
          //}
        },
      ),
    );
  }
}
