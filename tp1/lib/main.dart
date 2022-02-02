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

class MyFavoritesWidget extends StatelessWidget{

   Widget build_candidate(CandidatModel candidat) {
    return  Container(
          height: 90,
          child: Row(
            children: [
              Expanded(
                  child: Image.network(candidat.imageUrl),
              ),
              Expanded(
                child: Text(candidat.name),
              ),
            ],
          )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: favorites.length,
            itemBuilder: (BuildContext context, int index) {
              return build_candidate(favorites[index]);
            }
          );
  }

}

class MyCandidatesList extends StatefulWidget {
  const MyCandidatesList({Key? key}) : super(key: key);

  @override
  State<MyCandidatesList> createState() => _MyCandidatesListStatefulWidgetState();

}



class _MyCandidatesListStatefulWidgetState extends State<MyCandidatesList> {

   Widget build_candidate(CandidatModel candidat) {
    return  Container(
          height: 90,
          child: Row(
            children: [
              Expanded(
                  child: Image.network(candidat.imageUrl),
              ),
              Expanded(
                child: Text(candidat.name),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                      setState(() {
                        candidat.toggleLike();
                        if(candidat.isLiked)
                          favorites.add(candidat); 
                    });
                  },
                    icon : Icon(
                      candidat.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: candidat.isLiked ? Colors.red : null,
                      semanticLabel: candidat.isLiked ? 'Remove from saved' : 'Save',
                    ),
                ), 
              ),
            ],
          )
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return  
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: candidats.length,
            itemBuilder: (BuildContext context, int index) {
              return build_candidate(candidats[index]);
            }
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
    MyCandidatesList(),
    MyFavoritesWidget(),
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

  void toggleLike() {
    this.isLiked = !this.isLiked;
  }
}

// class CandidatWidget{
//   Container candidatWidget; 

//   CandidatWidget(this.candidatWidget); 
// }

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
List<CandidatModel> favorites = []; 

