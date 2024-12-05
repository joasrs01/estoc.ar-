import 'package:flutter/material.dart';

import '../util/util.dart';
import 'listar_estoques.dart';
import 'listar_produtos.dart';
import 'movimentacao.dart';
import 'realizar_movimentacao.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 4, 57, 89),
              ),
              onPressed: () {
                print('Ícone de usuário clicado');
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _ConstruirCard('Produtos', () {
                Util.NavegarDireitaPara(context, const ListarProdutos());
              }),
              _ConstruirCard('Estoques', () {
                Util.NavegarDireitaPara(context, const ListarEstoques());
              }),
              _ConstruirCard('Realizar Movimentação', () {
                Util.NavegarDireitaPara(context, const RealizarMovimentacao());
              }),
              _ConstruirCard('Consultar Movimentação', () {
                Util.NavegarDireitaPara(context, const Movimentacao());
              }),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 4, 57, 89),
            ),
            onPressed: () {
              print('Ícone de usuário clicado');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _ConstruirCard('Produtos', () {
              Util.NavegarDireitaPara(context, const ListarProdutos());
            }),
            _ConstruirCard('Estoques', () {
              Util.NavegarDireitaPara(context, const ListarEstoques());
            }),
            _ConstruirCard('Realizar Movimentação', () {
              Util.NavegarDireitaPara(context, const RealizarMovimentacao());
            }),
            _ConstruirCard('Consultar Movimentação', () {
              Util.NavegarDireitaPara(context, const Movimentacao());
            }),
          ],
        ),
      ),
    );
  }

  Route _createRoute(Widget Page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Widget _ConstruirCard(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 4, 57, 89),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
