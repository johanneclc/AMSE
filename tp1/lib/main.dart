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
    return GestureDetector(
          child : Container(
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
                          else
                            favorites.remove(candidat);
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
            ),
            ),
            onTap:  () => {Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>CandidatDetails(candidat: candidat)))},
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
            },
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
    const Center(child: Text('Développé par : Johanne Calcoen\nDate de derniere version: 04/02/2022')),
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



class CandidatDetails extends StatelessWidget {
  final CandidatModel candidat;
  const CandidatDetails({Key? key, required this.candidat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(candidat.name),),
      body: Column(
        children: [
           Expanded(
                    child: Image.network(candidat.imageUrl),
                ),
          Text(candidat.description,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
        ],
      ),
    );
  }
}

final candidats = [
  CandidatModel(
    name: "Anne Hidalgo",
    imageUrl: "images/anne_hidalgo.jpg",
    description: "Ana María Hidalgo Aleu, dite Anne Hidalgo , née le 19 juin 1959 à San Fernando (Espagne), est une femme politique française possédant également la nationalité espagnole. Membre du Parti socialiste (PS), elle est première adjointe au maire de Paris de 2001 à 2014 et conseillère régionale d'Île-de-France de 2004 à 2014. À l'issue des élections municipales de 2014, elle devient la première femme maire de Paris ; elle est réélue à la suite des élections municipales de 2020."
  ),
  CandidatModel(
      name: "Jean Lassalle",
      imageUrl: "images/jean_lassalle.png",
      description: "Jean Lassalle, né le 3 mai 1955 à Lourdios-Ichère (Pyrénées-Atlantiques), est un homme politique français. Il est maire de Lourdios-Ichère de 1977 à 2017 et député depuis 2002. Remarqué pour ses interventions à l'Assemblée nationale, il acquiert une notoriété nationale avec sa grève de la faim pour éviter le départ de la vallée d'Aspe de l’usine Toyal. Candidat à l'élection présidentielle de 2017, il finit en septième position sur onze candidats."
  ),
  CandidatModel(
      name: "Marine Le Pen",
      imageUrl: "images/marine_lepen.jpg",
      description: "Marine Le Pen, née le 5 août 1968 à Neuilly-sur-Seine (Hauts-de-Seine), est une femme politique française. Elle s'engage dès sa majorité au sein du Front national (FN), le principal parti d'extrême droite en France, dirigé par son père Jean-Marie Le Pen. Elle occupe plusieurs mandats locaux à partir de 1998 (conseillère régionale d'Île-de-France, du Nord-Pas-de-Calais puis des Hauts-de-France, conseillère municipale d'Hénin-Beaumont) et siège de 2004 à 2017 au Parlement européen, où elle co-préside le groupe Europe des nations et des libertés (ENL) à partir de 2015."
  ),
  CandidatModel(
      name: "Emmanuel Macron",
      imageUrl: "images/emmanuel_macron.jpg",
      description: "Emmanuel Macron, né le 21 décembre 1977 à Amiens (France), est un haut fonctionnaire, banquier d'affaires et homme d'État français. Il est président de la République française depuis le 14 mai 2017."
  ),
  CandidatModel(
      name: "Jean-Luc Mélenchon",
      imageUrl: "images/jeanLuc_melenchon.jpg",
      description: "Jean-Luc Mélenchon, né le 19 août 1951 à Tanger (Maroc), est un homme politique français. Membre du Parti socialiste (PS) à partir de 1976, il est successivement élu conseiller municipal de Massy en 1983, conseiller général de l'Essonne en 1985 et sénateur en 1986. Il est également ministre délégué à l'Enseignement professionnel de 2000 à 2002, dans le gouvernement Lionel Jospin. Il fait partie de l'aile gauche du PS jusqu'au congrès de Reims de 2008, à l'issue duquel il quitte le parti pour fonder le Parti de gauche (PG), dont il devient d'abord président du bureau national, puis coprésident, fonction qu'il conserve jusqu'en 2014."
  ),
  CandidatModel(
      name: "Valerie Pecresse",
      imageUrl: "images/valerie_pecresse.jpg",
      description: "Valérie Pécresse , née Valérie Roux le 14 juillet 1967 à Neuilly-sur-Seine, est une femme politique française. Maître des requêtes au Conseil d'État de 1992 à 2015, elle est conseillère de Jacques Chirac et enseigne à l'Institut d'études politiques de Paris. Lors des élections législatives de 2002, elle est élue députée dans la deuxième circonscription des Yvelines. Elle est réélue en 2007, mais ne siège pas en raison de son entrée au premier gouvernement François Fillon."
  ),
  CandidatModel(
      name: "Philippe Poutou",
      imageUrl: "images/philippe_poutou.jpg",
      description: "Philippe Poutou, né le 14 mars 1967 à Villemomble (département de la Seine), est un ouvrier, syndicaliste et homme politique français. Ouvrier dans une usine Ford, il milite dans les rangs de la CGT contre la fermeture de celle-ci, qui a finalement lieu en 2019."
  ),
  CandidatModel(
      name: "Eric Zemmour",
      imageUrl: "images/eric_zemmour.jpg",
      description: "Éric Zemmour , né le 31 août 1958 à Montreuil, est un journaliste, écrivain, essayiste, éditorialiste, chroniqueur, polémiste et homme politique français d'extrême droite. Diplômé de l'Institut d'études politiques de Paris, il commence une carrière dans la presse écrite en travaillant au Quotidien de Paris de 1986 à 1994. Il rejoint en 1996 le service politique du Figaro, où il reste jusqu'en 2009 et revient en 2013, tout en écrivant des chroniques au Figaro Magazine jusqu’en 2021."
  ),

];
List<CandidatModel> favorites = []; 

