import 'package:flutter/material.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de obras de arte com informações adicionais
  final List<Map<String, String>> _artworks = [
    {
      'title': 'Monalisa',
      'artist': 'Leonardo da Vinci',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKGcmciSy4FGjphPQWDgP6nnQdpqCYYMsSjWlDT2hv9A&s',
      'year': '1503',
      'summary': 'Retrato de Lisa Gherardini, esposa de Francesco del Giocondo.',
      'history': 'A "Monalisa", também conhecida como "La Gioconda", é uma das pinturas mais famosas e enigmáticas do mundo, criada por Leonardo da Vinci no início do século 16. A obra retrata uma mulher com uma expressão facial ambígua, muitas vezes descrita como enigmática, que tem fascinado espectadores e especialistas por séculos. A técnica de sfumato usada por da Vinci confere à pintura uma qualidade quase etérea, com contornos suaves e uma transição sutil entre cores e tons. A identidade da mulher retratada ainda é objeto de debate, embora muitos acreditem que seja Lisa Gherardini, esposa de um comerciante florentino.'
    },
    {
      'title': 'O Grito',
      'artist': 'Edvard Munch',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz9tyaIberfeZnTRePF0cRDxHRIb3CI1lwHetsbhUUyg&s',
      'year': '1893',
      'summary': 'Representa uma figura angustiada contra um céu vermelho sangue.',
      'history': 'O Grito" é uma obra expressionista do pintor norueguês Edvard Munch, criada em 1893. A pintura é conhecida por sua representação intensa e emocional de um momento psicológico agudo. A figura central, com um rosto distorcido em uma expressão de angústia, está em uma ponte com um céu vermelho dramático ao fundo. A obra é frequentemente interpretada como uma representação da ansiedade e do desespero humano, e é uma das imagens mais icônicas da arte moderna.'
    },
    {
      'title': 'A Noite Estrelada',
      'artist': 'Vincent van Gogh',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/2560px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg',
      'year': '1889',
      'summary': 'Visão noturna de uma aldeia sob um céu estrelado.',
      'history': 'A Noite Estrelada", pintada por Vincent van Gogh em 1889, é uma das suas obras mais famosas e celebradas. A pintura retrata uma vista dramática e turbulenta do céu noturno, com um redemoinho de estrelas azuis brilhantes e uma lua crescente. O cenário é complementado por uma vila tranquila abaixo e uma cipreste flamejante no primeiro plano. Esta obra é frequentemente vista como uma expressão das emoções internas de van Gogh, com o céu dinâmico servindo como um reflexo de sua turbulência interior. A técnica de pinceladas grossas e o uso vibrante de cores são características distintivas do estilo de van Gogh.'
    },
  ];

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
      );
    }
  });
}


  Widget _buildArtGallery() {
    return ListView.builder(
      itemCount: _artworks.length,
      itemBuilder: (context, index) {
        final artwork = _artworks[index];
        return Card(
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('${artwork['title']} - ${artwork['artist']} (${artwork['year']})'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Image.network(artwork['image']!,
                                  width: 300, height: 200, fit: BoxFit.cover),
                              SizedBox(height: 8),
                              Text('Resumo: ${artwork['summary']}'),
                              SizedBox(height: 8),
                              Text('História: ${artwork['history']}'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Fechar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Image.network(
                  artwork['image']!,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${artwork['title']} - ${artwork['artist']}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> get _widgetOptions => <Widget>[
    _buildArtGallery(),
    Text('Página de Pesquisa', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    SettingsScreen(), // Adicione a nova tela aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria de Arte'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configurações'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
