import 'package:flutter/material.dart';
import 'package:flutter_application_1/slider.dart';
import '../Home.dart'; // Certifique-se de que o caminho esteja correto

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Escolha o tamanho da fonte'),
            SliderExample(),
          ],
        ),
      ),
    );
  }
}
