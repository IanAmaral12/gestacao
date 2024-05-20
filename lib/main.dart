import 'package:flutter/material.dart';
import 'homepage.dart';
import 'menu.dart';
import 'quiz.dart';
import 'creditos.dart';
import 'resultado.dart';
import 'calcsem.dart';


void main() {
  runApp(AppMaterno());
}

class AppMaterno extends StatelessWidget {
  const AppMaterno({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remover o debug da tela
      home: TelaInicial(),
    );
  }
}