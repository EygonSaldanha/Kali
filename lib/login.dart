import 'package:flutter/material.dart';
import 'Home.dart';  // Certifique-se de que o caminho esteja correto
import 'main.dart';  // Importa a classe MyApp que contém a RegistrationScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _matricula = '';
  String _password = '';

  void _tryLogin() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      _formKey.currentState?.save();
      // Aqui você pode incluir sua lógica para validar a matrícula e a senha
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
                  decoration: InputDecoration(labelText: 'Matrícula'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua matrícula';
                    }
                    return null; // Removida a validação de 6 dígitos
                  },
                  onSaved: (value) => _matricula = value ?? '',
                ),
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