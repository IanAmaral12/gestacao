import 'package:flutter/material.dart';

class GestacaoFetal {
  static Map<int, String> tamanhoFetoPorSemana = {
    1: "Grão de Arroz",
    2: "Semente de Papoula",
    3: "Gergelim",
    4: "Semente de Papoula",
    5: "Semente de Maçã",
    6: "Lentilha",
    7: "Mirtilo",
    8: "Framboesa",
    9: "Uva",
    10: "Ameixa Seca",
    11: "Figo",
    12: "Limão",
    13: "Vagem Média",
    14: "Limão Siciliano",
    15: "Maçã",
    16: "Avocado",
    17: "Romã",
    18: "Batata Doce",
    19: "Laranja",
    20: "Banana",
    21: "Cenoura",
    22: "Côco",
    23: "Manga Grande",
    24: "Melão Cantaloupe",
    25: "Couve-Flor",
    26: "Couve",
    27: "Alface",
    28: "Beringela",
    29: "Abóbora Japonesa",
    30: "Pepino",
    31: "Aspargo",
    32: "Nabo Mexicano",
    33: "Salsão",
    34: "Abóbora Paulista",
    35: "Abacaxi",
    36: "Mamão",
    37: "Abóbora d'água",
    38: "Abóbora",
    39: "Melancia",
    40: "Jaca",
  };

  static Map<String, List<String>> examesPorTrimestre = {
    'Primeiro Trimestre (1 a 12 semanas)': [
      'Confirmação da gravidez: Teste de beta-hCG.',
      'Ultrassom inicial: Confirmação da idade gestacional e viabilidade da gestação.',
      'Hemograma completo: Avaliação geral da saúde materna.',
      'Glicemia de jejum: Avaliação do risco de diabetes gestacional.',
      'Tipagem sanguínea e fator Rh: Importante para detectar incompatibilidades sanguíneas.',
      'Sorologia para sífilis (VDRL): Teste de sífilis.',
      'Sorologia para HIV: Teste de HIV.',
      'Sorologia para hepatite B e C: Testes de hepatite.',
      'Exame de urina (EAS e urocultura): Detecção de infecções urinárias.',
      'TSH e T4 livre: Avaliação da função tireoidiana.',
      'Coombs indireto: Para gestantes Rh-negativo.',
      'Citologia cervical (Papanicolau): Se não foi feito recentemente.',
    ],
    'Segundo Trimestre (13 a 28 semanas)': [
      'Ultrassom morfológico de 1º trimestre (entre 11 e 14 semanas): Avaliação de anomalias fetais e translucência nucal.',
      'Teste de tolerância à glicose (24 a 28 semanas): Diagnóstico de diabetes gestacional.',
      'Hemograma completo: Reavaliação da saúde materna.',
      'Sorologia para toxoplasmose: Repetir se necessário.',
      'Sorologia para citomegalovírus: Repetir se necessário.',
      'Sorologia para rubéola: Repetir se necessário.',
      'Exame de urina (EAS e urocultura): Repetir para monitoramento de infecções.',
      'Coombs indireto: Repetir para gestantes Rh-negativo.',
      'Ultrassom morfológico de 2º trimestre (entre 20 e 24 semanas): Avaliação detalhada do desenvolvimento fetal.',
    ],
    'Terceiro Trimestre (29 a 40 semanas)': [
      'Ultrassom obstétrico: Avaliação do crescimento fetal e da quantidade de líquido amniótico.',
      'Hemograma completo: Monitoramento da saúde materna.',
      'Glicemia de jejum: Repetir se necessário.',
      'Sorologia para sífilis (VDRL): Repetir no terceiro trimestre.',
      'Sorologia para HIV: Repetir no terceiro trimestre.',
      'Sorologia para hepatite B e C: Repetir se necessário.',
      'Exame de urina (EAS e urocultura): Repetir para monitoramento de infecções.',
      'Teste para estreptococo do grupo B (35 a 37 semanas): Avaliação do risco de infecção neonatal.',
      'Cardiotocografia: Avaliação da frequência cardíaca fetal e das contrações uterinas, especialmente em gestações de alto risco.',
      'Perfil biofísico fetal: Avaliação do bem-estar fetal em gestações de alto risco.',
    ],
  };

  static String calcularTamanhoFeto(int semanas) {
    return tamanhoFetoPorSemana[semanas] ?? "Não há correspondência para essa semana de gestação.";
  }

  static List<String> examesNecessarios(int semanas) {
    if (semanas >= 1 && semanas <= 12) {
      return examesPorTrimestre['Primeiro Trimestre (1 a 12 semanas)']!;
    } else if (semanas >= 13 && semanas <= 28) {
      return examesPorTrimestre['Segundo Trimestre (13 a 28 semanas)']!;
    } else if (semanas >= 29 && semanas <= 40) {
      return examesPorTrimestre['Terceiro Trimestre (29 a 40 semanas)']!;
    } else {
      return ["Nenhum exame recomendado para esta semana de gestação."];
    }
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

  @override
  void calcularTamanhoFeto() {
    int semanas = int.tryParse(semanasController.text) ?? 0;
    String tamanho = GestacaoFetal.calcularTamanhoFeto(semanas);
    setState(() {
      resultado = tamanho;
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
