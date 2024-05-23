import 'package:flutter/material.dart';
import 'resultado.dart';
import 'quiz_dados.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int erros = 0;
  int acertos = 0;

  void respondeu(int respostaNumero) {
    setState(() {
      if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
        acertos++;
      } else {
        erros++;
      }

      if (perguntaNumero == quiz.length) {
        Navigator.pushNamed(
          context,
          Resultado.routeName,
          arguments: Argumentos(acertos, erros),
        );
      } else {
        perguntaNumero++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEF86A6),
          title: Text(
            'QUIZ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ),
        body: Container(
          color: Color(0xFFEF86A6),
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Pergunta $perguntaNumero de ${quiz.length}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  quiz[perguntaNumero - 1]['pergunta'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(quiz[perguntaNumero - 1]['imagem'], height: 300),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      respondeu(1);
                    },
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][0],
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
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
                      respondeu(2);
                    },
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][1],
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
                SizedBox(height: 20.0), // Adicionando um espaçamento para evitar que fique colado na barra inferior
              ],
            ),
          ),
        ),
      ),
    );
  }
}
