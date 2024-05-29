import 'package:flutter/material.dart';
import 'main.dart';
import 'menu.dart';
import 'quiz.dart';
import 'homepage.dart';
import 'resultado.dart';
import 'calcsem.dart';

//tela de creditos
class TelaDeCreditosApp extends StatelessWidget {
  const TelaDeCreditosApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text('CRÉDITOS', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
        centerTitle: true, //centralizar o titulo
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),
        child: Center(
          //child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Disciplina: Desenvolvimento de Software:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0), // Reduzi o espaço entre os textos
              Text(
                'Prof. Dr. Elvio Gilberto da Silva',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Reduzi o espaço entre os textos
              Text(
                'Colaboradora:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0), // Reduzi o espaço entre os textos
              Text(
                'Profa. Dra. Marta Helena de Souza de Conti',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Reduzi o espaço entre os textos
              Text(
                'Desenvolvedores:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0), // Reduzi o espaço entre os textos
              Text(
                'Fabricio Ricci Lopes \nGabriel Bento de Aguiar \nKauê Kanagusko Ruiz \nIan Felipe Amaral Olivera Silva \nMarcio Bincoleto Junior',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Adicionando um espaçamento para desenvolvimento e apoio
              Text(
                'Desenvolvimento:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset('assets/Ciencia_da_Computacao1.jpg', height: 100),
              SizedBox(height: 20.0),
              Text(
                'Apoio:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset('assets/Ciencia_da_Computacao.jpg', height: 100),
            ],
          ),
          //),
        ),
      ),
    );
  }
}
