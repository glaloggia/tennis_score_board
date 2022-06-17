class Dashboard{
  final pointsArray = ['15','30','40'];
  late Iterator<String> aPointsIterator;
  late Iterator<String> bPointsIterator;
  late Iterator <List<dynamic>> setsIterator;
  late Iterator <List<dynamic>> bSetsIterator;
  late bool deuce;
  late bool advantageA;
  late bool advantageB;
  final row = 5;
  final col = 2;
  late List<List> scoreBoard;
  dynamic currentGame;
  late bool isTieBreak;

  Dashboard(){
    deuce = false;
    advantageA = false;
    advantageB = false;
    isTieBreak = false;
    scoreBoard = List.generate(row, (i) => List.filled(col, 0, growable: false), growable: false);
    setsIterator = scoreBoard.iterator;
    setsIterator.moveNext();
    aPointsIterator = pointsArray.iterator;
    bPointsIterator = pointsArray.iterator;
    currentGame = ["0","0"];
  }

  pointA(){
    if(deuce){
      setAdvantage('A');
    }else if(advantageA){
      gameA();
    }else if(aPointsIterator.moveNext()){
      currentGame[0] = aPointsIterator.current;
      if((currentGame[0] == '40')&&(currentGame[1]=='40')) deuce = true;
    }
  }

  pointB(){
    if(deuce){
      setAdvantage('B');
    }else if(bPointsIterator.moveNext()){
      currentGame[1] = bPointsIterator.current;
    }
    if((currentGame[0] == '40')&&(currentGame[1]=='40')) deuce = true;
  }


  void setAdvantage(String s) {
    switch(s){
      case 'A':
        {
          advantageA = true;
          advantageB = false;
          currentGame[0] = 'A';
        }
        break;
      case 'B':
        {
          advantageB = true;
          advantageA = false;
          currentGame[1] = 'A';
        }
        break;
    }
  }

  void gameA() {
    setsIterator.current[0]++;
    if((setsIterator.current[0] == 6)&&( setsIterator.current[1]==6)){
      isTieBreak = true;
    }else if((setsIterator.current[0] >  6 )&&( setsIterator.current[0] - setsIterator.current[1] == 2)){
      setsIterator.moveNext();
    }
  }

}