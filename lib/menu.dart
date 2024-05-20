import 'package:flutter/material.dart';
import 'main.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'creditos.dart';
import 'resultado.dart';
import 'calcsem.dart';

class TelaDeAcessoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text('MENU', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, //centralizar o titulo*/
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navegar para a nova tela (TelaDeAcessoApp)
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Pegunta01()),
                  );
                },
                child: Text('Quiz', style: TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  // Navegar para a nova tela (TelaDeAcessoApp)
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TelaCalculadoraSemanas()),
                  );
                },
                child: Text('Calculadora de semanas', style: TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  // Adicione a ação do botão aqui
                },
                child: Text('Baixar revista digital', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}