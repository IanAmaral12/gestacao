import 'package:flutter/material.dart';

class RevistaDigitalScreen extends StatefulWidget {
  @override
  _RevistaDigitalScreenState createState() => _RevistaDigitalScreenState();
}

class _RevistaDigitalScreenState extends State<RevistaDigitalScreen> {
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'Título da Página 1',
      'text': 'Texto principal da página 1.',
      'image': 'assets/imagem1.png', // Substitua pelo caminho correto
    },
    {
      'title': 'Título da Página 2',
      'text': 'Texto principal da página 2.',
      'image': 'assets/imagem2.png', // Substitua pelo caminho correto
    },
    // Adicione mais páginas conforme necessário
  ];

  void nextPage() {
    setState(() {
      if (currentPage < pages.length - 1) {
        currentPage++;
      }
    });
  }

  void previousPage() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text(
          'REVISTA DIGITAL',
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pages[currentPage]['title']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                pages[currentPage]['text']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Image.asset(pages[currentPage]['image']!, height: 200),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: previousPage,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: nextPage,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
