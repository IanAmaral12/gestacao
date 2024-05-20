import 'package:flutter/material.dart';
import 'main.dart';
import 'menu.dart';
import 'quiz.dart';
import 'homepage.dart';
import 'creditos.dart';
import 'resultado.dart';

//tela da calculadora de semanas
class TelaCalculadoraSemanas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text('CALCULADORA DE SEMANAS', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, //centralizar o titulo*/
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),
        child: Center(
          child: Column(
            //aqui que vamos add toda a logica da calculadora de semanas
          ),
        ),
      ),
    );
  }
}