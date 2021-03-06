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
    const Center(child: Text('Bonjour !  \nIci, d??couvre tous les candidats \naux ??lections pr??sidentielles !', 
                              style: optionStyle)),
    MyCandidatesList(),
    MyFavoritesWidget(),
    const Center(child: Text('D??velopp?? par : Johanne Calcoen\nDate de derniere version: 04/02/2022')),
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
    description: "Ana Mar??a Hidalgo Aleu, dite Anne Hidalgo , n??e le 19 juin 1959 ?? San Fernando (Espagne), est une femme politique fran??aise poss??dant ??galement la nationalit?? espagnole. Membre du Parti socialiste (PS), elle est premi??re adjointe au maire de Paris de 2001 ?? 2014 et conseill??re r??gionale d'??le-de-France de 2004 ?? 2014. ?? l'issue des ??lections municipales de 2014, elle devient la premi??re femme maire de Paris ; elle est r????lue ?? la suite des ??lections municipales de 2020."
  ),
  CandidatModel(
      name: "Jean Lassalle",
      imageUrl: "images/jean_lassalle.png",
      description: "Jean Lassalle, n?? le 3 mai 1955 ?? Lourdios-Ich??re (Pyr??n??es-Atlantiques), est un homme politique fran??ais. Il est maire de Lourdios-Ich??re de 1977 ?? 2017 et d??put?? depuis 2002. Remarqu?? pour ses interventions ?? l'Assembl??e nationale, il acquiert une notori??t?? nationale avec sa gr??ve de la faim pour ??viter le d??part de la vall??e d'Aspe de l???usine Toyal. Candidat ?? l'??lection pr??sidentielle de 2017, il finit en septi??me position sur onze candidats."
  ),
  CandidatModel(
      name: "Marine Le Pen",
      imageUrl: "images/marine_lepen.jpg",
      description: "Marine Le Pen, n??e le 5 ao??t 1968 ?? Neuilly-sur-Seine (Hauts-de-Seine), est une femme politique fran??aise. Elle s'engage d??s sa majorit?? au sein du Front national (FN), le principal parti d'extr??me droite en France, dirig?? par son p??re Jean-Marie Le Pen. Elle occupe plusieurs mandats locaux ?? partir de 1998 (conseill??re r??gionale d'??le-de-France, du Nord-Pas-de-Calais puis des Hauts-de-France, conseill??re municipale d'H??nin-Beaumont) et si??ge de 2004 ?? 2017 au Parlement europ??en, o?? elle co-pr??side le groupe Europe des nations et des libert??s (ENL) ?? partir de 2015."
  ),
  CandidatModel(
      name: "Emmanuel Macron",
      imageUrl: "images/emmanuel_macron.jpg",
      description: "Emmanuel Macron, n?? le 21 d??cembre 1977 ?? Amiens (France), est un haut fonctionnaire, banquier d'affaires et homme d'??tat fran??ais. Il est pr??sident de la R??publique fran??aise depuis le 14 mai 2017."
  ),
  CandidatModel(
      name: "Jean-Luc M??lenchon",
      imageUrl: "images/jeanLuc_melenchon.jpg",
      description: "Jean-Luc M??lenchon, n?? le 19 ao??t 1951 ?? Tanger (Maroc), est un homme politique fran??ais. Membre du Parti socialiste (PS) ?? partir de 1976, il est successivement ??lu conseiller municipal de Massy en 1983, conseiller g??n??ral de l'Essonne en 1985 et s??nateur en 1986. Il est ??galement ministre d??l??gu?? ?? l'Enseignement professionnel de 2000 ?? 2002, dans le gouvernement Lionel Jospin. Il fait partie de l'aile gauche du PS jusqu'au congr??s de Reims de 2008, ?? l'issue duquel il quitte le parti pour fonder le Parti de gauche (PG), dont il devient d'abord pr??sident du bureau national, puis copr??sident, fonction qu'il conserve jusqu'en 2014."
  ),
  CandidatModel(
      name: "Valerie Pecresse",
      imageUrl: "images/valerie_pecresse.jpg",
      description: "Val??rie P??cresse , n??e Val??rie Roux le 14 juillet 1967 ?? Neuilly-sur-Seine, est une femme politique fran??aise. Ma??tre des requ??tes au Conseil d'??tat de 1992 ?? 2015, elle est conseill??re de Jacques Chirac et enseigne ?? l'Institut d'??tudes politiques de Paris. Lors des ??lections l??gislatives de 2002, elle est ??lue d??put??e dans la deuxi??me circonscription des Yvelines. Elle est r????lue en 2007, mais ne si??ge pas en raison de son entr??e au premier gouvernement Fran??ois Fillon."
  ),
  CandidatModel(
      name: "Philippe Poutou",
      imageUrl: "images/philippe_poutou.jpg",
      description: "Philippe Poutou, n?? le 14 mars 1967 ?? Villemomble (d??partement de la Seine), est un ouvrier, syndicaliste et homme politique fran??ais. Ouvrier dans une usine Ford, il milite dans les rangs de la CGT contre la fermeture de celle-ci, qui a finalement lieu en 2019."
  ),
  CandidatModel(
      name: "Eric Zemmour",
      imageUrl: "images/eric_zemmour.jpg",
      description: "??ric Zemmour , n?? le 31 ao??t 1958 ?? Montreuil, est un journaliste, ??crivain, essayiste, ??ditorialiste, chroniqueur, pol??miste et homme politique fran??ais d'extr??me droite. Dipl??m?? de l'Institut d'??tudes politiques de Paris, il commence une carri??re dans la presse ??crite en travaillant au Quotidien de Paris de 1986 ?? 1994. Il rejoint en 1996 le service politique du Figaro, o?? il reste jusqu'en 2009 et revient en 2013, tout en ??crivant des chroniques au Figaro Magazine jusqu???en 2021."
  ),

];
List<CandidatModel> favorites = []; 

