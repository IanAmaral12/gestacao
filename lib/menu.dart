import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

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
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () async {
                  bool granted = await requestStoragePermission(context);
                  if (granted) {
                    await copyAssetToStorage(context, 'assets/revista_gestacao.pdf', 'revista_gestacao.pdf');
                  }
                },
                child: Text(
                  'Baixar revista digital',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> requestStoragePermission(BuildContext context) async {
    if (Platform.isAndroid) {
      // Para Android 10 (API 29) e superior
      if (await Permission.manageExternalStorage.request().isGranted) {
        return true;
      } else if (await Permission.manageExternalStorage.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Permissão de armazenamento permanentemente negada. Abra as configurações do aplicativo para conceder a permissão.'),
            action: SnackBarAction(
              label: 'Configurações',
              onPressed: () {
                openAppSettings();
              },
            ),
          ),
        );
        return false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Permissão de armazenamento negada.')),
        );
        return false;
      }
    }
    return true;
  }

  Future<void> copyAssetToStorage(BuildContext context, String assetPath, String fileName) async {
    try {
      // Lê o arquivo PDF dos assets
      final byteData = await rootBundle.load(assetPath);
      print('Arquivo carregado dos assets.');

      // Obtém o diretório de downloads
      final downloadsDirectory = Directory('/storage/emulated/0/Download');
      if (!downloadsDirectory.existsSync()) {
        print('Diretório de downloads não existe.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Diretório de downloads não encontrado.')),
        );
        return;
      }

      print('Diretório de armazenamento obtido: ${downloadsDirectory.path}');
      // Constrói o caminho completo do arquivo
      final file = File('${downloadsDirectory.path}/$fileName');

      // Salva o arquivo no armazenamento externo
      await file.writeAsBytes(byteData.buffer.asUint8List());
      print('Arquivo salvo em: ${file.path}');

      // Verifica se o arquivo foi salvo corretamente
      if (file.existsSync()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Arquivo baixado em: ${file.path}')),
        );
        showNotification('Download concluído', 'Arquivo baixado em: ${file.path}');
      } else {
        print('Falha ao salvar o arquivo.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao salvar o arquivo.')),
        );
      }
    } catch (e) {
      print('Erro ao copiar arquivo: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao copiar arquivo: $e')),
      );
    }
  }

  void showNotification(String title, String body) {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'download_channel',
      'Downloads',
      channelDescription: 'Canal de notificações para downloads',
      importance: Importance.max,
      priority: Priority.high,
    );
    var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics);
  }
}
