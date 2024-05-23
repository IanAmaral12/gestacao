import 'package:flutter/material.dart';
import 'respostas.dart';

class Argumentos {
  final int acertos;
  final int erros;

  Argumentos(this.acertos, this.erros);
}

class Resultado extends StatelessWidget {
  static const routeName = 'resultado';

  const Resultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEF86A6),
          title: Text(
            'GESTAÇÃO, VIDA E SAÚDE',
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
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(color: Color(0xFFEF86A6)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Resultado:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Parabéns! Você acertou: \n ${argumentos.acertos} de 14 perguntas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Você errou: \n ${argumentos.erros} de 14 perguntas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'menu',
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Text(
                      'Voltar ao Menu',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'respostas',
                      );
                    },
                    child: Text(
                      'Visualizar Respostas',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 20),
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
