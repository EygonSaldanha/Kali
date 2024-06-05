import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_application_1/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'views/login.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Cadastro',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: LoginScreen(), // Inicie com a tela de Login
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _matricula = '';
  String _password = '';
  String _confirmPassword = '';

  void _trySubmitForm() {
    final isValid = _formKey.currentState?.validate() ??
        false; // Se for null, considere como false
    if (isValid) {
      _formKey.currentState?.save();
      if (_password != _confirmPassword) {
        ScaffoldMessenger.of(Provider.of(context as BuildContext))
            .showSnackBar(SnackBar(content: Text('As senhas não coincidem.')));
      } else {
        // Redireciona para a tela de Login após o cadastro
        Navigator.pushReplacement(
          context as BuildContext,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Center(
        child: Card(
          color: Theme.of(context).colorScheme.background,
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Matrícula',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor insira sua matrícula.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _matricula = value ?? '';
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.blue.shade800),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 7) {
                        return 'A senha deve ter pelo menos 7 caracteres.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value ?? '';
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirme a Senha',
                      labelStyle: TextStyle(color: Colors.blue.shade800),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor confirme sua senha.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _confirmPassword = value ?? '';
                    },
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: _trySubmitForm,
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.blue.shade800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
