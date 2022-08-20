class Dashboard {
  final pointsArray = ['15', '30', '40'];
  late Iterator<String> aPointsIterator;
  late Iterator<String> bPointsIterator;
  late Iterator<List<dynamic>> setsIterator;
  late Iterator<List<dynamic>> bSetsIterator;
  late bool deuce;
  late bool advantageA;
  late bool advantageB;
  final row = 5;
  final col = 2;
  late List<List> scoreBoard;
  dynamic currentGame;
  late bool isTieBreak;
  late int pointsATB;
  late int pointsBTB;
  late bool isActive;

  Dashboard() {
    isActive = true;
    deuce = false;
    advantageA = false;
    advantageB = false;
    isTieBreak = false;
    scoreBoard = List.generate(row, (i) => List.filled(col, 0, growable: false),
        growable: false);
    setsIterator = scoreBoard.iterator;
    setsIterator.moveNext();
    aPointsIterator = pointsArray.iterator;
    bPointsIterator = pointsArray.iterator;
    currentGame = ["0", "0"];
    pointsATB = 0;
    pointsBTB = 0;
  }

  pointA() {
    if (isTieBreak) {
      pointATb();
    } else if (deuce) {
      setAdvantage('A');
    } else if (advantageA) {
      gameA();
    }else if (advantageB){
      advantageB = false;
      currentGame[1]='40';
      deuce = true;
    } else if (aPointsIterator.moveNext()) {
      currentGame[0] = aPointsIterator.current;
      if ((currentGame[0] == '40') && (currentGame[1] == '40')) deuce = true;
    } else {
      gameA();
    }
  }

  pointB() {
    if (isTieBreak) {
      pointBTb();
    } else if (deuce) {
      setAdvantage('B');
    } else if (advantageB) {
      gameB();
    }else if (advantageA){
      advantageA = false;
      deuce = true;
      currentGame[0]='40';
    } else if (bPointsIterator.moveNext()) {
      currentGame[1] = bPointsIterator.current;
      if ((currentGame[1] == '40') && (currentGame[0] == '40')) deuce = true;
    } else {
      gameB();
    }
  }

  void setAdvantage(String s) {
    switch (s) {
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
    deuce = false;
  }

  void gameA() {
    setsIterator.current[0]++;
    if ((setsIterator.current[0] == 6) && (setsIterator.current[1] == 6)) {
      isTieBreak = true;
    } else if ((setsIterator.current[0] >= 6) &&
        (setsIterator.current[0] - setsIterator.current[1] > 1)) {
      if (!setsIterator.moveNext()) isActive = false;
    }
    currentGame[0] = '0';
    currentGame[1] = '0';
    aPointsIterator = pointsArray.iterator;
    bPointsIterator = pointsArray.iterator;
    deuce = false;
    advantageA = false;
    advantageB = false;
    isTieBreak = false;
  }

  void gameB() {
    setsIterator.current[1]++;
    if ((setsIterator.current[1] == 6) && (setsIterator.current[0] == 6)) {
      isTieBreak = true;
    } else if ((setsIterator.current[1] >= 6) &&
        (setsIterator.current[1] - setsIterator.current[0] > 1)) {
      if (!setsIterator.moveNext()) isActive = false;
    }
    currentGame[0] = '0';
    currentGame[1] = '0';
    aPointsIterator = pointsArray.iterator;
    bPointsIterator = pointsArray.iterator;
    deuce = false;
    advantageA = false;
    advantageB = false;
    isTieBreak = false;
  }

  void pointATb() {
    pointsATB++;
    if ((pointsATB > 6) && (pointsATB - pointsBTB > 1)) {
      gameA();
      pointsATB = 0;
      pointsBTB = 0;
    }
  }

  void pointBTb() {
    pointsBTB++;
    if ((pointsBTB > 6) && (pointsBTB - pointsATB > 1)) {
      gameB();
      pointsATB = 0;
      pointsBTB = 0;
    }
  }
}
