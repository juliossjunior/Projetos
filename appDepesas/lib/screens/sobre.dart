import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  Color topColor = Color.fromARGB(255, 33, 9, 62);
  Color bottomColor = Colors.white;
  Color bottomColorAppBar = Color.fromARGB(255, 33, 9, 62);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sobre',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [topColor, bottomColorAppBar],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [topColor, bottomColor],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 100,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),

              //CARD
              Card(
                margin: EdgeInsets.all(10),
                elevation: 120,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset('images/foto.png', height: 80),
                    Align(alignment: Alignment.topLeft),
                    SizedBox(height: 30),
                    Text(
                      'Controle de Despesas Pessoais',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      //textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Objetivo: Controlar as despesas do dia a dia.',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Desenvolvido por Júlio Sérgio',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
