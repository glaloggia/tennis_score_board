import 'package:flutter/material.dart';
import 'package:tennis_score_board/dashboard.dart';
import 'package:share_plus/share_plus.dart';

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
        backgroundColor: Color.fromRGBO(140,45,8,1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Spacer(),
            ],),
            DataTable(
                  headingRowColor:MaterialStateProperty.all(Color.fromRGBO(255, 111, 54, 1)),
                  dataRowColor:MaterialStateProperty.all(Color.fromRGBO(255, 111, 54, 1)),


                  border: TableBorder(
                      verticalInside: BorderSide(width: 2.5,color: Color.fromRGBO(24, 217, 185, 1)),
                      horizontalInside: BorderSide(width: 2.5,color: Color.fromRGBO(24, 217, 185, 1)),
                      left: BorderSide(width: 5,color: Color.fromRGBO(24, 217, 185, 1)),
                      right: BorderSide(width: 5,color: Color.fromRGBO(24, 217, 185, 1)),
                      bottom: BorderSide(width: 5,color: Color.fromRGBO(24, 217, 185, 1)),
                  ),
                  columnSpacing: 20,
                  columns: const [
                    DataColumn(label:Text("Player",style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontWeight: FontWeight.bold))),
                    DataColumn(label:Text("Set 1",style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontWeight: FontWeight.bold))),
                    DataColumn(label:Text("Set 2",style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontWeight: FontWeight.bold))),
                    DataColumn(label:Text("Set 3",style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontWeight: FontWeight.bold))),
                    DataColumn(label:Text("Set 4",style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontWeight: FontWeight.bold))),
                    DataColumn(label:Text("Set 5",style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontWeight: FontWeight.bold)))
                  ],
                  rows: [
                  DataRow(cells:[
                    const DataCell(Text('A',style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 40))),
                    DataCell(Text(newDashboard.scoreBoard[0][0].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[1][0].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[2][0].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[3][0].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[4][0].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells:[
                    const DataCell(Text('B',style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 40))),
                    DataCell(Text(newDashboard.scoreBoard[0][1].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[1][1].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[2][1].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[3][1].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[4][1].toString(),style: TextStyle(color: Color.fromRGBO(90, 90, 90, 1),fontSize: 30,fontWeight: FontWeight.bold))),
                    ]
                    ),
                  ]
            ),
            Spacer(),
            // Divider(color: Color.fromRGBO(24, 217, 185, 1),thickness: 2,),
            Row(children: [
              Spacer(),
              Text("Points A",style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Points B",style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold)),
              Spacer(),
            ],),
            Divider(color: Color.fromRGBO(24, 217, 185, 1),thickness: 5),
            Row(children: [
              Spacer(),
              Text(
                newDashboard.currentGame[0].toString(),
                style: TextStyle(fontSize: 40.0,color: Colors.white)
              ),
              Spacer(),
              Text(
                newDashboard.currentGame[1].toString(),
                style: TextStyle(fontSize: 40.0,color: Colors.white),
              ),
              Spacer()
            ],),
            Divider(color: Color.fromRGBO(24, 217, 185, 1),thickness: 10),
            Spacer(),
            Row(children: [
              Spacer(),
              ElevatedButton(onPressed: _incrementCounterA,
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(0,140,117, 1)),
                  ),
                  child: Text('Point to A', style: TextStyle(fontSize: 30.0),) ),
              Spacer(),
              ElevatedButton(onPressed: _incrementCounterB,
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(0,140,117,1)),

                  ),
                  child: Text('Point to B ', style: TextStyle(fontSize: 30.0),)),
              Spacer(),
            ],),
            Row(children: [
              Spacer(),
              ElevatedButton(onPressed: _resetMatch,
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(0,140,117, 1)),
                  ),
                  child: Text("RESET",style: TextStyle(fontSize: 30.0),)),
              Spacer()
            ],),
            Spacer()
          ],
        ),
      ),
        backgroundColor: Color.fromRGBO(217, 68, 23, 1),
    );
  }
}
