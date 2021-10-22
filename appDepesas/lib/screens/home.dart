import 'dart:math';
import 'package:despesas/screens/logins.dart';
import 'package:despesas/screens/transacao.dart';
import 'package:despesas/screens/transacao_form.dart';
import 'package:despesas/screens/transacao_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Despesas Pessoais',
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color topColor = Color.fromARGB(255, 33, 9, 62);
  Color bottomColor = Colors.white;
  Color bottomColorAppBar = Color.fromARGB(255, 33, 9, 62);
  List<String> itensMenu = ["Sair"];

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Sair":
        _sairUsuario();
        break;
    }
  }

  _sairUsuario() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Logins()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),
        ],
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('images/desp.png', height: 200),
            Align(alignment: Alignment.topLeft),
            SizedBox(height: 60),
            Text(
              'Despesas Pessoais',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              //textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
