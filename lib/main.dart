import 'package:flutter/material.dart';
import 'package:tennis_score_board/dashboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
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
  int _selectedIndex = 0;
  Color _scoreboardbg = Color.fromRGBO(255, 111, 54, 1);
  Color _scoreboarlinesdbg = Color.fromRGBO(24, 217, 185, 1);
  Color _scoreboardtext = Color.fromRGBO(90, 90, 90, 1);
  Color _apptitlebg = Color.fromRGBO(140,45,8,1);
  Color _appbg = Color.fromRGBO(217, 68, 23, 1);
  Color _pointstext = Color.fromRGBO(249, 229, 245, 1);

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

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if (index == 0) {
          _appbg = Colors.deepPurpleAccent;
          _apptitlebg = Color.fromRGBO(0, 123, 34, 1);
          _scoreboardtext = Colors.purple;
          _scoreboarlinesdbg = Colors.deepPurple;
          _scoreboardbg = MaterialStateColor.resolveWith((states) {return Color.fromRGBO(249, 229, 245, 1);});
          _pointstext = Color.fromRGBO(249, 229, 245, 1);
        }else{
          _appbg = Color.fromRGBO(217, 68, 23, 1);
          _apptitlebg = Color.fromRGBO(140,45,8,1);
          _scoreboardtext = Color.fromRGBO(90, 90, 90, 1);
          _scoreboarlinesdbg = Color.fromRGBO(24, 217, 185, 1);
          _scoreboardbg = MaterialStateColor.resolveWith((states) {return Color.fromRGBO(255, 111, 54, 1);});
          _pointstext = Colors.white;
        }
      });
    }


  @override
  Widget build(BuildContext context) {
    var scoreboardTextStyle = TextStyle(color: _scoreboardtext,fontWeight: FontWeight.bold);
    var scoreboardBorderStyle = BorderSide(width: 2.5,color: _scoreboarlinesdbg);
    var scoreboardBackgroundColor = _scoreboardbg;

    final BannerAd myBanner = BannerAd(
      adUnitId: 'ca-app-pub-1494903485989800/7751009963',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    );

    final BannerAdListener listener = BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => print('Ad impression.'),
    );

    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);

    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: _apptitlebg,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Share the app',
            onPressed: () {
              Share.share('https://play.google.com/store/apps/details?id=com.keepthatscore.tennis');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Spacer(),
            ],),
            DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) {return scoreboardBackgroundColor;}),
                  dataRowColor:MaterialStateColor.resolveWith((states) {return scoreboardBackgroundColor;}),

                  border: TableBorder(
                      verticalInside: scoreboardBorderStyle,
                      horizontalInside: scoreboardBorderStyle,
                      left: scoreboardBorderStyle,
                      right: scoreboardBorderStyle,
                      bottom: scoreboardBorderStyle,
                  ),
                  columnSpacing: 20,
                  columns:  [
                    DataColumn(label:Text("Player",style: scoreboardTextStyle)),
                    DataColumn(label:Text("Set 1",style: scoreboardTextStyle)),
                    DataColumn(label:Text("Set 2",style: scoreboardTextStyle)),
                    DataColumn(label:Text("Set 3",style: scoreboardTextStyle)),
                    DataColumn(label:Text("Set 4",style: scoreboardTextStyle)),
                    DataColumn(label:Text("Set 5",style: scoreboardTextStyle)),
                  ],
                  rows: [
                  DataRow(cells:[
                    DataCell(Text('A',style: TextStyle(color: _scoreboardtext,fontSize: 40))),
                    DataCell(Text(newDashboard.scoreBoard[0][0].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[1][0].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[2][0].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[3][0].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[4][0].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells:[
                    DataCell(Text('B',style: TextStyle(color: _scoreboardtext,fontSize: 40))),
                    DataCell(Text(newDashboard.scoreBoard[0][1].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[1][1].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[2][1].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[3][1].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    DataCell(Text(newDashboard.scoreBoard[4][1].toString(),style: TextStyle(color: _scoreboardtext,fontSize: 30,fontWeight: FontWeight.bold))),
                    ]
                    ),
                  ]
            ),
            Spacer(),
            // Divider(color: Color.fromRGBO(24, 217, 185, 1),thickness: 2,),
              Row(children: [
                Spacer(),
                Text("Points A", style: TextStyle(fontSize: 30.0,
                    color: _pointstext,
                    fontWeight: FontWeight.bold)),
                Spacer(),
                Text("Points B", style: TextStyle(fontSize: 30.0,
                    color: _pointstext,
                    fontWeight: FontWeight.bold)),
                Spacer(),
              ],),
              Divider(color: Color.fromRGBO(24, 217, 185, 1), thickness: 5),
              Row(children: [
                Spacer(),
                Text(
                    newDashboard.currentGame[0].toString(),
                    style: TextStyle(fontSize: 40.0, color: _pointstext)
                ),
                Spacer(),
                Text(
                  newDashboard.currentGame[1].toString(),
                  style: TextStyle(fontSize: 40.0, color: _pointstext),
                ),
                Spacer()
              ],),
              Divider(color: Color.fromRGBO(24, 217, 185, 1), thickness: 10),
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
            // Spacer(),
            adContainer
          ],
        ),
      ),
        backgroundColor: _appbg,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_tennis),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: _apptitlebg,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromRGBO(0,140,117, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
