import 'package:flutter/material.dart';
import 'package:telas_app/classes/autenticacao.dart';

class Util {
  static Autenticacao autenticacao = Autenticacao();

  static void NavegarDireitaPara(BuildContext context, Widget Page) {
    Navigator.of(context).push(_createRoute(Page, true));
  }

  static void NavegarEsquerdaPara(BuildContext context, Widget Page) {
    Navigator.of(context).push(_createRoute(Page, false));
  }

  static Route _createRoute(Widget Page, bool fromRight) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = fromRight
            ? const Offset(1.0, 0.0)
            : const Offset(
                -1.0, 0.0); // Início da animação (padrao vindo da direita)
        var end = Offset.zero; // Fim da animação (posição final)
        var curve = Curves.easeInOut;

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

  static void apresentarMensagemRodape(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }
}
