import 'package:flutter/material.dart';

//backend
void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
                title: 'Tamanho do Bebê',
                theme: ThemeData(
                primarySwatch: Colors.blue,
      ),
        home: InicioScreen(), // Definindo a tela de início como a tela inicial
    );
    }
}

class InicioScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(
                title: Text('Bem Vindo!'),
      ),
        body: Container(
                decoration: BoxDecoration(
                color: Colors.lightBlueAccent, // Cor de fundo personalizada
        ),
        child: Center(
                child: ElevatedButton(
                onPressed: () {
            // Navegar para a tela de cálculo do tamanho do feto
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
              );
        },
        child: Text(
                'Entrar',
                style: TextStyle(fontSize: 20.0),
            ),
        style: ElevatedButton.styleFrom(
                //primary: Colors.white, // Cor do botão
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),
        ),
      ),
    );
    }
}

class GestacaoFetal {
    static Map<int, String> semanaParaFruta = {
            1: "grao de arroz",
            2: "semente de papoula",
            3: "gergelim",
            4: "feijao",
            5: "lentilha",
            6: "grao de ervilha",
            7: "Mirtilo",
            8: "Framboesa",
            9: "Azeitona",
            10: "Ameixa Seca",
            20: "Banana",
            24: "Melão Cantalupo",
            28: "Beringela",
            35: "Coco",
            37: "Melão",
            38: "Abóbora",
            39: "Melancia",
            40: "Jaca",
    // Adicione mais semanas e frutas conforme necessário
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
                title: Text('Exames durante a Gestação'),
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

class MyHomePage extends StatefulWidget {
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

    //frontend
    @override
    Widget build(BuildContext context) {
        imagemFruta = Container(); // Inicializa a variável de imagem
        return Scaffold(
                appBar: AppBar(
                title: Text('Tamanho do Feto'),
      ),
        body: Container(
                decoration: BoxDecoration(
                color: Colors.lightBlueAccent, // Cor de fundo personalizada
        ),
        child: Center(
                child: SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
        Text(
                'Digite o número de semanas de gestação:',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
        SizedBox(height: 10),
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
        SizedBox(height: 20),
        ElevatedButton(
                onPressed: calcularTamanhoFeto,
                child: Text(
                'Calcular',
                style: TextStyle(fontSize: 20.0),
                  ),
        style: ElevatedButton.styleFrom(
                //primary: Colors.white, // Cor do botão
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
        SizedBox(height: 30),
        Text(
                'Tamanho do feto corresponde a um:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
                ),
        Text(
                resultado,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
        SizedBox(height: 40),
        ElevatedButton(
                onPressed: verExames,
                child: Text(
                'Ver Exames',
                style: TextStyle(fontSize: 20.0),
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