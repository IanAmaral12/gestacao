import 'package:flutter/material.dart';
import 'quiz_dados.dart';

class Respostas extends StatelessWidget {
  static const routeName = 'respostas';

  const Respostas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text(
          'RESPOSTAS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        color: Color(0xFFEF86A6),
        child: ListView.builder(
          itemCount: quiz.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  quiz[index]['pergunta'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Resposta Correta: ${quiz[index]['respostas'][quiz[index]['alternativa_correta'] - 1]}",
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Explicação: ${quiz[index]['explicacao']}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
