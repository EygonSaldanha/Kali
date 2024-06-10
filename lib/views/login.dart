import 'package:flutter/material.dart';
import '../Home.dart'; 
import '../main.dart';  // Importa a classe MyApp que contém a RegistrationScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _tryLogin() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      _formKey.currentState?.save();
      // Aqui você pode incluir sua lógica para validar o usuário e a senha
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void _navigateToSignUp() {
    // Substitua 'MainScreen()' pela tela de cadastro correta se ela for diferente
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Usuário'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu usuário';
                    }
                    return null;
                  },
                  onSaved: (value) => _username = value ?? '',
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value ?? '',
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _tryLogin,
                  child: Text('Login'),
                ),
                TextButton(
                  onPressed: _navigateToSignUp,
                  child: Text('Não tem conta? Cadastre-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}