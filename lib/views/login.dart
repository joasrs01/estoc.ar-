import 'package:flutter/material.dart';
import 'package:telas_app/views/cadastro_usuario.dart';
import 'package:telas_app/views/home.dart';

import '../../util/util.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController usuarioController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 140,
              child: Image.asset(
                "assets/images/logo_bambu.png",
                width: 406,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              controller: usuarioController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Usuário",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: senhaController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 4, 57, 89),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: const SizedBox(
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () async {
                    var autenticado = await Util.autenticacao.autenticarUsuario(
                        usuarioController.text, senhaController.text);

                    if (autenticado) {
                      Util.apresentarMensagemRodape(context, "Bem vindo!");
                      Util.NavegarDireitaPara(context, const Home());
                    } else {
                      Util.apresentarMensagemRodape(context,
                          "Não foi possível efetuar o login, usuario ou senha incorretos!");
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: TextButton(
                child: const Text(
                  "ou Cadastre-se!",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Util.NavegarDireitaPara(context, const CadastroUsuario());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
