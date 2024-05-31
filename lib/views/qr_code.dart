import 'package:flutter/material.dart';
import '../Home.dart';

class qr_code extends StatefulWidget {
  @override
  qr_codepage createState() => qr_codepage();
}

class qr_codepage extends State<qr_code> {
  bool _showBackButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de pesquisa'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      backgroundColor: Colors.transparent, 
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/imagem_pesquisa.jpg'),
            fit: BoxFit.cover, 
          ),
        ),
        child: Center(
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 500),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (BuildContext context, double value, Widget? child) {
              return Transform.scale(
                scale: value,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      if (_showBackButton)
                        IconButton(
                          onPressed: () {
                            Navigator.popUntil(context, ModalRoute.withName('/search'));
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      Expanded(
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              _showBackButton = text.isNotEmpty;
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: _showBackButton ? null : Icon(Icons.search),
                            hintText: 'Pesquisar...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
