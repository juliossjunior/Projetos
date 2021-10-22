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
      home: Desp(),
    ),
  );
}

class Desp extends StatefulWidget {
  @override
  _DespState createState() => _DespState();
}

class _DespState extends State<Desp> {
  List<String> itensMenu = ["Configurações", "Sair"];

  final _transacao = [
    Transacao(
      id: 't0',
      titulo: 'Supermercado',
      valor: 310.90,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't1',
      titulo: 'Conta de Luz',
      valor: 300.00,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Conta de Agua',
      valor: 180.02,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't3',
      titulo: 'Cartão de Crédito',
      valor: 1800.30,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't4',
      titulo: 'Combustível',
      valor: 250.00,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't5',
      titulo: 'Faxineira',
      valor: 560.00,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't6',
      titulo: 'Cinema',
      valor: 150.00,
      data: DateTime.now(),
    )
  ];

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

  List<Transacao> get _recentTransacao {
    return _transacao.where((tr) {
      return tr.data.isAfter(
        DateTime.now(),
      );
    }).toList();
  }

  _addTransacao(String titulo, double valor) {
    final newTransacao = Transacao(
      id: Random().nextDouble().toString(),
      titulo: titulo,
      valor: valor,
      data: DateTime.now(),
    );

    setState(() {
      _transacao.add(newTransacao);
    });

    Navigator.of(context).pop();
  }

  _openTransacaoFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransacaoForm(_addTransacao);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Depesas Pessoais'),
        backgroundColor: Color(0xFF21093e),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TransacaoList(_transacao),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransacaoFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
