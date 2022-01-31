import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final tab = [
    const Center(child: Text('Bonjour !  \nIci, découvre tous les candidats \naux élections présidentielles !', 
                              style: optionStyle)),
    ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: candidats.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 90,
          child: Row(
            children: [
              Expanded(
                  child: Image.network(candidats[index].imageUrl),
              ),
              Expanded(
                child: Text(candidats[index].name),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                      setState(() {
                        candidats[index].isLiked ? () => candidats[index].unLike() : () => candidats[index].like();
                    });
                  },
                    icon : Icon(
                      candidats[index].isLiked ? Icons.favorite : Icons.favorite_border,
                      color: candidats[index].isLiked ? Colors.red : null,
                      semanticLabel: candidats[index].isLiked ? 'Remove from saved' : 'Save',
                    ),
                  
                ), 
                // onTap: () { 
                //   setState(() {
                //     if (candidats[index].isLiked) {
                //       candidats[index].isLiked = false; 
                //     } else { 
                //       candidats[index].isLiked = true; 
                //     } 
                //   });
                // }
              ),
            ],
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),


    const Center(child: Text('bonjour', style: optionStyle)),


    const Center(child: Text('Développé par : Johanne Calcoen\nDate de derniere version: 31/01/2022')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: tab[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // <-- This works for fixed
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Candidats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'A propos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class CandidatModel{
  String name;
  String imageUrl;
  String description;
  bool isLiked; 

  CandidatModel({required this.name,required this.imageUrl,required this.description, this.isLiked= false}); 

  void like(){
    this.isLiked = true; 
  }

  void unLike(){
    this.isLiked = false; 
  }
}

final candidats = [
  CandidatModel(
    name: "Anne Hidalgo",
    imageUrl: "images/anne_hidalgo.jpg",
    description: "candidate aux présidentielles 2022"
  ),
  CandidatModel(
      name: "Emmanuel Macron",
      imageUrl: "images/emmanuel_macron.jpg",
      description: "candidat aux présidentielles 2022"
  ),
  CandidatModel(
      name: "Jean-Luc Mélenchon",
      imageUrl: "images/jeanLuc_melenchon.jpg",
      description: "candidat aux présidentielles 2022"
  ),
  CandidatModel(
      name: "Eric Zemmour",
      imageUrl: "images/eric_zemmour.jpg",
      description: "candidat aux présidentielles 2022"
  ),

];
