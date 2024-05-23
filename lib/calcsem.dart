import 'package:flutter/material.dart';

class GestacaoFetal {
  static Map<int, String> semanaParaFruta = {
    1: "assets/frutas/grao_de_arroz.png",
    2: "assets/frutas/semente_de_papoula.png",
    3: "assets/frutas/gergelim.png",
    // ... adicionar os caminhos das outras imagens
    40: "assets/frutas/jaca.png",
  };

  static Map<int, List<String>> examesPorSemana = {
    1: [
      'tipagem sanguínea', 'hemograma', 'glicemia de jejum',
      // ... outras recomendações
    ],
    20: ['ultrassom morfológico de segundo trimestre', 'ultrassom transvaginal para medir o colo do útero', 'sorologia para toxoplasmose'],
    24: ['teste oral de tolerância à glicose', 'ecocardiograma fetal'],
    28: ['hemograma', 'exame de urina e cultura de urina', 'sorologias para HIV, sífilis e hepatite C', 'ultrassonografia obstétrica'],
    35: ['hemograma', 'exame de urina e cultura de urina', 'sorologias para HIV, sífilis e hepatite C', 'ultrassonografia obstétrica'],
  };

  static Widget mostrarImagemFruta(int semanas) {
    String? assetPath = semanaParaFruta[semanas];
    if (assetPath != null) {
      return Image.asset(
        assetPath,
        width: 200,
        height: 200,
        errorBuilder: (context, error, stackTrace) => Text('Erro ao carregar imagem'),
      );
    } else {
      return Text("Não há correspondência para essa semana de gestação.");
    }
  }

  static String calcularTamanhoFeto(int semanas) {
    return semanaParaFruta[semanas] != null ? semanaParaFruta[semanas]! : "Não há correspondência para essa semana de gestação.";
  }

  static List<String> examesNecessarios(int semanas) {
    return examesPorSemana[semanas] ?? ["Nenhum exame recomendado para esta semana de gestação."];
  }
}

class ExamesScreen extends StatelessWidget {
  final int semanas;

  ExamesScreen({required this.semanas});

  @override
  Widget build(BuildContext context) {
    List<String> exames = GestacaoFetal.examesNecessarios(semanas);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text(
          'EXAMES DURANTE A GESTAÇÃO',
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(exames[index]),
            subtitle: Text('Realizar conforme recomendação médica'),
          );
        },
      ),
    );
  }
}

class TelaCalculadoraSemanas extends StatefulWidget {
  @override
  _TelaCalculadoraSemanas createState() => _TelaCalculadoraSemanas();
}

class _TelaCalculadoraSemanas extends State<TelaCalculadoraSemanas> {
  TextEditingController semanasController = TextEditingController();
  String resultado = "";
  Widget imagemFruta = Container(); // Inicializa como um Container vazio

  @override
  void initState() {
    super.initState();
    imagemFruta = Container(); // Inicializa a variável de imagem
  }

  void calcularTamanhoFeto() {
    int semanas = int.tryParse(semanasController.text) ?? 0;
    String tamanho = GestacaoFetal.calcularTamanhoFeto(semanas);
    Widget imagem = GestacaoFetal.mostrarImagemFruta(semanas); // Obtém a imagem correspondente
    setState(() {
      resultado = tamanho;
      imagemFruta = imagem; // Atualiza a variável de imagem
    });
  }

  void verExames() {
    int semanas = int.tryParse(semanasController.text) ?? 0;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExamesScreen(semanas: semanas)),
    );
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
          title: Text(
            'CALCULADORA DE SEMANAS',
            style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFFEF86A6),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFFEF86A6)),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Digite o número de semanas de gestação:',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 250,
                    child: TextField(
                      controller: semanasController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Número de semanas',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: calcularTamanhoFeto,
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 26.0, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Tamanho do feto corresponde a um:',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Text(
                    resultado,
                    style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 250),
                  ElevatedButton(
                    onPressed: verExames,
                    child: Text(
                      'Ver Exames',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                  SizedBox(height: 20),
                  imagemFruta,
                  SizedBox(height: 20.0), // Adicionando um espaçamento para evitar que fique colado na barra inferior
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
