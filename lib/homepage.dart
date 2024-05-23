import 'package:flutter/material.dart';
import 'menu.dart';
import 'creditos.dart';
import 'revista_digital.dart'; // Importando a nova tela de revista digital

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 300),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RevistaDigitalScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'REVISTA DIGITAL',
                  style: TextStyle(color: Colors.black, fontSize: 28.0),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaDeAcessoApp()),
                  );
                },
                child: Text(
                  'ACESSAR',
                  style: TextStyle(color: Colors.black, fontSize: 38.0),
                ),
              ),
              SizedBox(height: 20.0), // Adicionando um espaçamento para evitar que fique colado na barra inferior
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'creditos');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text(
                  'CRÉDITOS',
                  style: TextStyle(fontSize: 28.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
