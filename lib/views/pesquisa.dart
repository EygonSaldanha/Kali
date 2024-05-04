import 'package:flutter/material.dart';
import 'package:flutter_application_1/slider.dart';
import '../Home.dart';

class Pesquisa extends StatelessWidget {
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
            Text('Conteúdo das configurações aqui'),
            SliderExample(),
          ],
        ),
      ),
    );
  }
}