import 'package:despesas/screens/logins.dart';
import 'package:flutter/material.dart';
import 'package:despesas/screens/sobre.dart';
import 'package:despesas/screens/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despesas Pessoais',
      home: Logins(),
      debugShowCheckedModeBanner: false,
    );
  }
}
