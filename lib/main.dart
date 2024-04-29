import 'package:flutter/material.dart';
import 'login.dart'; // Certifique-se de que o caminho para login.dart está correto.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Cadastro',
      theme: ThemeData(
        primaryColor: Colors.blue.shade800,
        hintColor: Colors.amber,
        appBarTheme: AppBarTheme(
          color: Colors.blue.shade800,
          titleTextStyle: TextStyle(
            color: Colors.amber.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          actionsIconTheme: IconThemeData(color: Colors.amber.shade600),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            foregroundColor: MaterialStateProperty.all(Colors.blue.shade800),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber.shade600),
          ),
          labelStyle: TextStyle(color: Colors.blue.shade800),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),  // Inicie com a tela de Login
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
  final isValid = _formKey.currentState?.validate() ?? false; // Se for null, considere como false
  if (isValid) {
    _formKey.currentState?.save();
    if (_password != _confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('As senhas não coincidem.'))
      );
    } else {
        // Redireciona para a tela de Login após o cadastro
        Navigator.pushReplacement(
          context,
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
          color: Colors.blue.shade100,
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
                      labelStyle: TextStyle(color: Colors.blue.shade800),
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
                      backgroundColor: Colors.amber,
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
