import 'package:flutter/material.dart';
import 'main.dart';
import 'menu.dart';
import 'quiz.dart';
import 'homepage.dart';
import 'resultado.dart';
import 'calcsem.dart';

//tela de creditos
class TelaDeCreditosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text('CRÉDITOS', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)
        ),
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
              /*Text('CREDITOS:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40.0),*/ // Espaço entre os parágrafos
              Text(
                'Diciplina: Desenvolvimento de Software:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Espaço entre os parágrafos
              Text(
                'Prof. Dr. Elvio Gilberto da Silva',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0), // Espaço entre os parágrafos
              Text(
                'Colaboradores:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Espaço entre os parágrafos
              Text(
                'Profa. Dra. Marta Helena de Souza de Conti',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0), // Espaço entre os parágrafos
              Text(
                'Desenvolvedores:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Espaço entre os parágrafos
              Text(
                'Fabricio Ricci Lopes \nGabriel Bento de Aguiar \nKauê Kanagusko Ruiz \nIan Felipe Amaral Olivera Silva \nMarcio Bincoleto Junior',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0),
              Image.asset('images/Ciencia_da_Computacao.jpg', height: 200),
              //Precisa ter um link da imagem do curso de ciência da computação aqui no final.
            ],
          ),
          //),
        ),
      ),
    );
  }
}