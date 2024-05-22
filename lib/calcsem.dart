import 'package:flutter/material.dart';

//backend da calculadora de semanas
class GestacaoFetal {
  static Map<int, String> semanaParaFruta = {
    1: "grao de arroz",
    2: "semente de papoula",
    3: "gergelim",
    4: "feijao",
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
    24: "Melão Cantalupo",
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
    37: "Abóbora D'Agua",
    38: "Abóbora",
    39: "Melancia",
    40: "Jaca",
  };

  static Map<int, List<String>> examesPorSemana = {
    1: ['tipagem sanguínea', 'hemograma', 'glicemia de jejum', 'exame de urina e cultura de urina', 'sorologias para vírus da imunodeficiência humana (HIV), sífilis, hepatite B, hepatite C, toxoplasmose, rubéola e citomegalovírus', 'ultrassom transvaginal', 'ultrassonografia morfológica de primeiro trimestre'],
    20: ['ultrassom morfológico de segundo trimestre', 'ultrassom transvaginal para medir o colo do útero', 'sorologia para toxoplasmose'],
    24: ['teste oral de tolerância à glicose', 'ecocardiograma fetal'],
    28: ['hemograma', 'exame de urina e cultura de urina', 'sorologias para vírus da imunodeficiência humana (HIV), sífilis e hepatite C', 'ultrassonografia obstétrica'],
    35: ['hemograma', 'exame de urina e cultura de urina', 'sorologias para vírus da imunodeficiência humana (HIV), sífilis e hepatite C', 'ultrassonografia obstétrica'],
  };

  static Widget mostrarImagemFruta(int semanas) {
    String? urlImagem = semanaParaFruta[semanas];
    if (urlImagem != null) {
      return Image.network(
        urlImagem,
        width: 200,
        height: 200,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return CircularProgressIndicator();
          }
        },
        errorBuilder: (context, error, stackTrace) => Text('Erro ao carregar imagem'),
      );
    } else {
      return Text("Não há correspondência para essa semana de gestação.");
    }
  }

  static String calcularTamanhoFeto(int semanas) {
    if (semanaParaFruta.containsKey(semanas)) {
      return semanaParaFruta[semanas]!;
    } else {
      return "Não há correspondência para essa semana de gestação.";
    }
  }

  static List<String> examesNecessarios(int semanas) {
    if (examesPorSemana.containsKey(semanas)) {
      return examesPorSemana[semanas]!;
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
        title: Text('EXAMES DURANTE A GESTAÇÃO', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
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
  late Widget imagemFruta; // Inicializa como um Container vazio

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
    // Navegar para a tela de exames com as semanas informadas
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExamesScreen(semanas: semanas)),
    );
  }

  //frontend calculadora de semanas
  @override
  Widget build(BuildContext context) {
    imagemFruta = Container(); // Inicializa a variável de imagem
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA DE SEMANAS', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFFEF86A6),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFEF86A6)
        ),
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
                    //primary: Colors.white, // Cor do botão
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
                    //rimary: Colors.white, // Cor do botão
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
                // Mostra a imagem da fruta correspondente
                imagemFruta,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
