import 'package:despesas/screens/cadastro.dart';
import 'package:despesas/screens/principal.dart';
import 'package:despesas/screens/sobre.dart';
import 'package:flutter/material.dart';

class Logins extends StatefulWidget {
  @override
  _LoginsState createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  Color topColor = Color.fromARGB(255, 33, 9, 62);
  Color bottomColor = Colors.transparent;

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              topColor,
              bottomColor,
            ],
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Image.asset(
                    "images/desp.png",
                    width: 10,
                    height: 200,
                  ),
                ),
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      hintText: "Nome",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                TextField(
                  obscureText: true,
                  controller: _controllerSenha,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    hintText: "Senha",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 33, 9, 62)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 33, 9, 62)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      onPressed: () {
                        String nome = _controllerNome.text;
                        String senha = _controllerSenha.text;

                        if (nome.isNotEmpty && senha.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Principal()),
                          );
                        } else {
                          setState(() {
                            _mensagemErro = "Preencha o Nome e a senha";
                          });
                        }
                      }),
                ),
                Text(
                  _mensagemErro,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta? Cadastra-se",
                      style: TextStyle(
                        color: Color(0xFF21093e),
                        fontSize: 14,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cadastro()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
