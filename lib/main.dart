import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'second_route.dart';

void main() => runApp(const MyApp());
const double paddingInset = 5;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<Widget> players = [];
int numOfPlayers = 0;

void addPlayer() {
  players.add(Row(children: <Widget>[
    Container(
      padding: const EdgeInsets.all(20.0),
      width: 200,
      child: const TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: "Player name"),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(left: 20),
      width: 150,
      child: SpinBox(
        min: -50,
        max: 50,
        value: 0,
        decoration: const InputDecoration(helperText: "Score"),
      ),
    ),
  ]));
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('Disc golf scores')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()));
            },
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              players.removeLast();
              numOfPlayers = players.length;
            });
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: players,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: Text('add players, total: ' + numOfPlayers.toString()),
        onPressed: () {
          numOfPlayers++;
          setState(() {
            addPlayer();
          });
        },
      ),
    );
  }
}
