import 'package:flutter/material.dart';

const double pi = 3.1415926535897932;

void main() {
  runApp(MaterialApp(
    home: const MyApp(), 
  ));
}

//HOME
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TP2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text("Welcome")
    );
  }
}

//EXERCICE 1
class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Exercice1(title: 'TP2'),
    );
  }
}

class Exercice1 extends StatefulWidget {
  const Exercice1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Exercice1> createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Image.network('https://picsum.photos/512/1024')
    );
  }
}

//EXERCICE 2
class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Exercice2(title: 'TP2'),
    );
  }
}


class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class Exercice2 extends StatefulWidget {
  const Exercice2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Exercice2> createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  double x = 0; 
  double y = 0; 
  double scale = 1; 

  Widget build_slider_x() {
    return Slider(
      value: x,
      min: -pi, 
      max: pi,
      divisions: 50,
      label: x.round().toString(),
      onChanged: (double value) {
        setState(() {
          x = value;
        });
      },
    );
  }

  Widget build_slider_y() {
    return Slider(
      value: y,
      min: -pi, 
      max: pi,
      label: y.round().toString(),
      onChanged: (double value) {
        setState(() {
          y = value;
        });
      },
    );
  }

  Widget build_slider_scale() {
    return Slider(
      value: scale,
      min: 0, 
      max: 1,
      label: scale.round().toString(),
      onChanged: (double value) {
        setState(() {
          scale = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
            ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateX(x)..rotateY(y)..scale(scale, scale),
                    child : Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Image.network('https://picsum.photos/512/1024'),
                    ),
                  ),
                  Row(
                    children : [
                      Expanded(
                        child: Text("orientation x :"), 
                      ),
                      Expanded(
                        child: build_slider_x(),
                      )                      
                    ]
                  ),
                  Row(
                    children : [
                      Expanded(
                        child: Text("orientation y :"), 
                      ),
                      Expanded(
                        child: build_slider_y(),
                      )                      
                    ]
                  ),
                  Row(
                    children : [
                      Expanded(
                        child: Text("Scale :"), 
                      ),
                      Expanded(
                        child: build_slider_scale()
                      )                      
                    ]
                  ),
                ],
              )
                               
    );
  }
}

//EXERCICE 4
class MyApp4 extends StatelessWidget {
  const MyApp4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Exercice4(title: 'TP2'),
    );
  }
}

class Exercice4 extends StatefulWidget {
  const Exercice4({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Exercice4> createState() => _Exercice4State();
}

class _Exercice4State extends State<Exercice4> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DisplayTileWidget()
    );
  }
}

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL,required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile = new Tile(
    imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 0));


class DisplayTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),
        Container(
            height: 200,
            child: Image.network('https://picsum.photos/512',
                fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}


//EXERCICE 5
class MyApp5 extends StatelessWidget {
  const MyApp5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Exercice5(title: 'TP2'),
    );
  }
}

class Exercice5 extends StatefulWidget {
  const Exercice5({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Exercice5> createState() => _Exercice5State();
}

class _Exercice5State extends State<Exercice5> {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  GridViewWidget(),
    );
  }
}

class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  double size = 3 ; 

  Widget build_slider() {
    return Slider(
      value: size,
      min: 2, 
      max: 10,
      divisions: 8,
      label: size.round().toString(),
      onChanged: (double value) {
        setState(() {
          size = value;
        });
      },
    );
  }


   @override
  Widget build(BuildContext context) {
    double coef = 2/size;
    List<Widget> listWidgets = []; 
    for (int i=0; i<size; i++){
          for (int j=0; j<size; j++){
              listWidgets.add(
                new Container(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                          child: (new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(-1+j*coef, -1+i*coef))).croppedImageTile(),
                          onTap: () {
                            print("tapped on tile");
                          },
                  ),
                )
              ); 
          }
        }; 


    return   Column(
                    children : [
                      Expanded(
                        child: new GridView.count(
                                  primary: false,
                                  padding: const EdgeInsets.all(20),
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1,
                                  crossAxisCount: size.toInt(),
                                  children: listWidgets,
                                ), 
                      ),
                      Expanded(
                        child: build_slider(),
                      )                      
                    ]
                  ); 
      
  }
}


// Menu 
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu TP2',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
            )
          ),
          ListTile(
            title: Text('Exercice 1 : Afficher une image'),
            onTap: () => {Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp1()))},
          ),
          ListTile(
            title: Text('Exercice 2 : Transformer une image'),
            onTap: () => {Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp2()))},
          ),
          ListTile(
            title: Text('Exercice 3'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text("Exercice 4 : Affichage d'une tuile"),
            onTap: () => {Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp4()))},
          ),
          ListTile(
            title: Text('Exercice 5 : Génération du plateau de tuiles'),
            onTap: () => {Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp5()))},
          ),
          ListTile(
            title: Text('Retour'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
