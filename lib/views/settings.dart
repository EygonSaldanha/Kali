import 'package:flutter/material.dart';
import 'package:flutter_application_1/slider.dart';
import 'package:flutter_application_1/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../Home.dart';
import 'login.dart';

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
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            ElevatedButton(
                child: Text('Tema'),
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // LOGOUT
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Confirmar Logout'),
                    content: Text('Você deseja sair do aplicativo?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Fecha o diálogo
                        },
                      ),
                      TextButton(
                        child: Text('Logout'),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            ModalRoute.withName('/'),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.red, // Define a cor do botão para vermelho
              ),
            ),
          ],
        ),
      ),
    );
  }
}
