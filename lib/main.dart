import 'package:flutter/material.dart';
import 'package:tennis_score_board/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Score Board',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tennis Score Board'),
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
  Dashboard newDashboard = Dashboard();


  void _incrementCounterA() {
    setState(() {
      newDashboard.pointA();
    });
  }

  void _incrementCounterB() {
    setState(() {
      newDashboard.pointB();
    });
  }

  void _resetMatch(){
    setState(() {
      newDashboard = Dashboard();
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Spacer(),
            ],),
              DataTable(
                  border: TableBorder(verticalInside: BorderSide(width: 2),
                      horizontalInside: BorderSide(width: 2)),
                  columnSpacing: 20,
                  columns: const [
                DataColumn(label:Text("Player")),
                DataColumn(label:Text("Set 1")),
                DataColumn(label:Text("Set 2")),
                DataColumn(label:Text("Set 3")),
                DataColumn(label:Text("Set 4")),
                DataColumn(label:Text("Set 5"))
              ],
                  rows: [
                DataRow(cells:[
                  const DataCell(Text('A')),
                  DataCell(Text(newDashboard.scoreBoard[0][0].toString())),
                  DataCell(Text(newDashboard.scoreBoard[1][0].toString())),
                  DataCell(Text(newDashboard.scoreBoard[2][0].toString())),
                  DataCell(Text(newDashboard.scoreBoard[3][0].toString())),
                  DataCell(Text(newDashboard.scoreBoard[4][0].toString())),
                ]),
                DataRow(cells:[
                  const DataCell(Text('B')),
                  DataCell(Text(newDashboard.scoreBoard[0][1].toString())),
                  DataCell(Text(newDashboard.scoreBoard[1][1].toString())),
                  DataCell(Text(newDashboard.scoreBoard[2][1].toString())),
                  DataCell(Text(newDashboard.scoreBoard[3][1].toString())),
                  DataCell(Text(newDashboard.scoreBoard[4][1].toString())),
                ]
                ),
              ]
              ),
            Spacer(),
            Row(children: [
              Spacer(),
              Text("Points A"),
              Spacer(),
              Text("Points B"),
              Spacer(),
            ],),
            Row(children: [
              Spacer(),
              Text(
                newDashboard.currentGame[0].toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              Spacer(),
              Text(
                newDashboard.currentGame[1].toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              Spacer()
            ],),
            Spacer(),
            Row(children: [
              Spacer(),
              ElevatedButton(onPressed: _incrementCounterA
                  ,child: Text('Point to A', style: TextStyle(fontSize: 20.0),) ),
              Spacer(),
              ElevatedButton(onPressed: _incrementCounterB
                  ,child: Text('Point to B ', style: TextStyle(fontSize: 20.0),) ),
              Spacer(),
            ],),
            // Spacer(),
            Spacer(),
            Row(children: [
              Spacer(),
              ElevatedButton(onPressed: _resetMatch, child: Text("RESET")),
              Spacer()
            ],),
            Spacer()
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
