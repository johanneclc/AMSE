import 'package:flutter/material.dart';

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

  Widget build_slider_x() {
    return Slider(
      value: x,
      max: 100,
      divisions: 5,
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
      max: 100,
      divisions: 5,
      label: y.round().toString(),
      onChanged: (double value) {
        setState(() {
          y = value;
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
                    transform: Matrix4.identity()..rotateX(x)..rotateY(y),
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
                ],
              )
                               
    );
  }
}



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
            title: Text('Exercice 4'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Exercice'),
            onTap: () => {Navigator.of(context).pop()},
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
