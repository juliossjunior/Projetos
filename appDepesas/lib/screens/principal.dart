import 'package:despesas/screens/desp.dart';
import 'package:despesas/screens/home.dart';
import 'package:despesas/screens/sobre.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Principal',
      home: Principal(),
    ),
  );
}

//
// TELA PRINCIPAL
//
class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  //Index da tela que será carregada
  var telaAtual = 0;

  //Controlador utilizado na troca das telas (páginas)
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BODY
      //
      body: PageView(
        controller: pageController,
        children: [
          Home(),
          Desp(),
          Sobre(),
          //TelaHome(),
          //TelaPesquisar(),
          //TelaNotificacoes(),

          //TelaConfiguracoes(),
        ],

        //Mudança de página: quando ocorrer a mudança de página
        //por meio da interação do usuário, é necessário
        //atualizar o valor da variável telaAtual
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),

      //
      // BARRA DE NAVEGAÇÃO
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 33, 9, 62),
        iconSize: 30,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.40),

        selectedFontSize: 16,
        unselectedFontSize: 16,

        //Index do botão selecionado
        currentIndex: telaAtual,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Despesas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Sobre',
          ),
          //BottomNavigationBarItem(
          //  icon: Icon(Icons.question_answer),
          //  label: 'Sobre',
          //),
        ],

        //Mudança de página através da interação com os
        //botões do BottomNavigationBar
        onTap: (index) {
          //atualizar o valor da variável telaAtual
          setState(() {
            telaAtual = index;
          });

          //efetuar a troca da página
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}

//
// TELA HOME
//
class TelaHome extends StatelessWidget {
  Color topColor = Color.fromARGB(255, 33, 9, 62);
  Color bottomColor = Colors.white;
  Color bottomColorAppBar = Color.fromARGB(255, 33, 9, 62);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: Center(
        child: Text(
          'Vazia',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}

//
// TELA PESQUISAR
//
class TelaPesquisar extends StatelessWidget {
  const TelaPesquisar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade200,
      child: Center(
        child: Text(
          'Pesquisar',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}

//
// TELA NOTIFICAÇÕES
//
class TelaNotificacoes extends StatelessWidget {
  const TelaNotificacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade200,
      child: Center(
        child: Text('Notificações', style: TextStyle(fontSize: 36)),
      ),
    );
  }
}

//
// TELA CONFIGURAÇÕES
//
class TelaConfiguracoes extends StatelessWidget {
  const TelaConfiguracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade200,
      child: Center(
        child: Text('Configurações', style: TextStyle(fontSize: 36)),
      ),
    );
  }
}
