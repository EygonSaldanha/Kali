import 'package:flutter/material.dart';
import 'homePage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _showBackButton = false;
  List<String> _suggestions = ["Monalisa", "O Grito", "A Noite Estrelada", "Guernica", "A Persistência da Memória", "A Criação de Adão"];
  List<String> _filteredSuggestions = [];

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
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.transparent, 
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(''),
            fit: BoxFit.cover, 
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
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
                                    _filteredSuggestions = _suggestions
                                        .where((suggestion) => suggestion.toLowerCase().contains(text.toLowerCase()))
                                        .toList();
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
            if (_filteredSuggestions.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredSuggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredSuggestions[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(artworkName: _filteredSuggestions[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}