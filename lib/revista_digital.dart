import 'package:flutter/material.dart';
import 'revista_digital_data.dart'; // Importando o novo arquivo com os dados

class RevistaDigitalScreen extends StatefulWidget {
  @override
  _RevistaDigitalScreenState createState() => _RevistaDigitalScreenState();
}

class _RevistaDigitalScreenState extends State<RevistaDigitalScreen> {
  int currentPage = 0;

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

  void goToPage(int index) {
    setState(() {
      currentPage = index;
      Navigator.pop(context); // Close the drawer after selection
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(pages[index]['title']!),
              onTap: () => goToPage(index),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: pages[currentPage]['content']!.map<Widget>((item) {
                        if (item is String) {
                          return Text(
                            item,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          );
                        } else if (item is Map<String, String> && item.containsKey('image')) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Image.asset(item['image']!),
                          );
                        } else {
                          return Container();
                        }
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 30.0), // Espaço maior para evitar sobreposição
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0), // Recuo maior do rodapé
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentPage > 0)
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          iconSize: 40,
                          onPressed: previousPage,
                        ),
                      if (currentPage == 0)
                        Spacer(), // Adiciona um espaço antes do botão de próxima página na primeira página
                      if (currentPage < pages.length - 1)
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          color: Colors.white,
                          iconSize: 40,
                          onPressed: nextPage,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
