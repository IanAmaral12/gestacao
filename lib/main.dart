import 'package:flutter/material.dart';
import 'homepage.dart';
import 'menu.dart';
import 'quiz.dart';
import 'creditos.dart';
import 'resultado.dart';
import 'calcsem.dart';
import 'respostas.dart';

void main() {
  runApp(AppMaterno());
}

class AppMaterno extends StatelessWidget {
  const AppMaterno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TelaInicial(),
        'creditos': (context) => TelaDeCreditosApp(),
        'menu': (context) => TelaDeAcessoApp(),
        'quiz': (context) => Quiz(),
        Resultado.routeName: (context) => Resultado(),
        'calcsem': (context) => TelaCalculadoraSemanas(),
        Respostas.routeName: (context) => Respostas(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
