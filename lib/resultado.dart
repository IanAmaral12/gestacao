import 'package:flutter/material.dart';
import 'main.dart';
import 'menu.dart';
import 'quiz.dart';
import 'homepage.dart';
import 'creditos.dart';
import 'calcsem.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key, required this.acertos,});

  final int acertos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text('GESTAÇÃO, VIDA E SAUDE', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, //centralizar o titulo
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),
        child: Center(
          //child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text ('Resultado:',
                style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
              ),

              Text ('Parabéns! Você acertou: \n $acertos de 14 perguntas',
                style: TextStyle(color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 300.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('botão funcionando falso');
                  },
                  child: Text('Jogar novamente', style: TextStyle(color: Colors.white, fontSize: 30.0)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}