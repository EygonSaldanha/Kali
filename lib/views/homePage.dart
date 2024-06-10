import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? artworkName; // Adicionado

  const HomePage({Key? key, this.artworkName}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    {
      'title': 'Guernica',
      'artist': 'Pablo Picasso',
      'image': 'https://upload.wikimedia.org/wikipedia/en/7/74/PicassoGuernica.jpg',
      'year': '1937',
      'summary': 'Representa o bombardeio de Guernica durante a Guerra Civil Espanhola.',
      'history': 'Guernica é uma das obras mais famosas de Pablo Picasso, criada em resposta ao bombardeio da cidade basca de Guernica em 1937 durante a Guerra Civil Espanhola. A pintura mostra os horrores da guerra e o sofrimento que ela inflige aos indivíduos, particularmente civis inocentes. O trabalho é um monumento ao medo, à violência e ao sofrimento humano.'
    },
    {
      'title': 'A Persistência da Memória',
      'artist': 'Salvador Dalí',
      'image': 'https://upload.wikimedia.org/wikipedia/en/d/dd/The_Persistence_of_Memory.jpg',
      'year': '1931',
      'summary': 'Famosa por seus relógios derretendo em uma paisagem desértica.',
      'history': 'A Persistência da Memória é uma pintura de 1931 do artista surrealista Salvador Dalí. A obra é famosa por sua representação de relógios derretidos em um cenário desértico. É amplamente interpretada como uma exploração do conceito de tempo e da sua subjetividade na percepção humana. A pintura é uma das imagens mais icônicas do surrealismo.'
    },
    {
      'title': 'A Criação de Adão',
      'artist': 'Michelangelo',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/The_Creation_of_Adam_%281%29.png/1200px-The_Creation_of_Adam_%281%29.png',
      'year': '1512',
      'summary': 'Parte do teto da Capela Sistina, representa Deus dando vida a Adão.',
      'history': 'A Criação de Adão é um dos afrescos mais célebres de Michelangelo, pintado entre 1508 e 1512 como parte do teto da Capela Sistina. A obra mostra o momento em que Deus dá vida a Adão, o primeiro homem, conforme narrado no Livro do Gênesis. A pintura é famosa por sua composição dinâmica e pelo toque icônico entre Deus e Adão.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeria de arte"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75, // Define a proporção entre largura e altura dos cards
        ),
        itemCount: _artworks.length,
        itemBuilder: (context, index) {
          final artwork = _artworks[index];

          if (widget.artworkName != null && widget.artworkName == artwork['title']) {
            Future.delayed(Duration.zero, () => _showArtworkDetails(context, artwork));
          }

          return Card(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () => _showArtworkDetails(context, artwork),
                  child: Image.network(
                    artwork['image']!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${artwork['title']} - ${artwork['artist']}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showArtworkDetails(BuildContext context, Map<String, String> artwork) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${artwork['title']} - ${artwork['artist']} (${artwork['year']})'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.network(artwork['image']!, width: 300, height: 500, fit: BoxFit.cover),
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
  }
}