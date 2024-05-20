import 'package:flutter/material.dart';
import 'main.dart';
import 'menu.dart';
import 'resultado.dart';
import 'homepage.dart';
import 'creditos.dart';
import 'calcsem.dart';

class Pegunta01 extends StatelessWidget { //pergunta 1
  @override
  Widget build(BuildContext context) {
    List quiz = [
      {
        "pergunta": "A região pélvica precisa de muito cuidado e atenção, seu enfraquecimento pode no trazer alguns problemas como: incontinência urinária e problemas sexuais.",
        //"imagem": "assets/pergunta01image.png",
        "respostas": [
          "Verdadeiro",
          "Falso",
        ],
        "Alternativa Correta":1,
      }
    ];

    quiz.add(
        {
        "pergunta":"A marcha (forma como anda) da gestante é normal.",
        "respostas":[
          "Verdadeiro",
          "Falso",
        ],
        "Alternativa Correta":2,
      }
    );

    int perguntaNumero = 2;

    print("dados do quiz");
    print(quiz);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text('QUIZ', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, //centralizar o titulo
      ),
      body: Container(
        color: Color(0xFFEF86A6),
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text ('Pergunta $perguntaNumero de 14', style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.bold),
              ),
              Text (quiz[perguntaNumero - 1]['pergunta'], style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),

              Image.asset('assets/pergunta01image.png', height: 300),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('botão funcionando');
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][0], style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('botão funcionando falso');
                  },
                  child: Text(quiz[perguntaNumero - 1]['respostas'][1], style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
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