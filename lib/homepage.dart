import 'package:flutter/material.dart';
import 'main.dart';
import 'menu.dart';
import 'quiz.dart';
import 'creditos.dart';
import 'resultado.dart';
import 'calcsem.dart';

class TelaInicial extends StatelessWidget {
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
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),

        child: Center(
          //child: Expanded(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset('assets/logo.png', height: 300),
              /*Text(
                'Gestação, Vida \ne Saúde',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),*/
              SizedBox(height: 100.0), // Espaço entre o texto e o botão

              ElevatedButton(
                onPressed: () {
                  // Navegar para a nova tela (TelaDeAcessoApp)
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TelaDeAcessoApp()),
                  );
                },
                child: Text('ACESSAR', style: TextStyle(color: Colors.black, fontSize: 38.0)),
              ),

              SizedBox(height: 200.0), // Espaço entre o botão e o texto "Créditos"

              ElevatedButton(
                onPressed: () {
                  // Navegação para a tela de créditos
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TelaDeCreditosApp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // Cor de fundo do botão
                  //onSurface: Colors.grey, // Cor de fundo do botão quando pressionado
                ),
                child: Text('CRÉDITOS', style: TextStyle(fontSize: 28.0, color: Colors.white)),
              ),
            ],
          ),
          //),
        ),
      ),
    );
  }
}