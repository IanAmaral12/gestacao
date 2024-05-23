import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TelaDeAcessoApp extends StatefulWidget {
  @override
  _TelaDeAcessoAppState createState() => _TelaDeAcessoAppState();
}

class _TelaDeAcessoAppState extends State<TelaDeAcessoApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEF86A6),
        title: Text(
          'MENU',
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
        decoration: BoxDecoration(color: Color(0xFFEF86A6)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'quiz');
                },
                child: Text(
                  'Quiz',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'calcsem');
                },
                child: Text(
                  'Calculadora de semanas',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20.0), // Adicionando um espaçamento para evitar que fique colado na barra inferior
            ],
          ),
        ),
      ),
    );
  }
}
