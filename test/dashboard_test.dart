import 'package:tennis_score_board/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('just a quick run', () {

    var aDashboard = new Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    print(aDashboard.currentGame);
    print(aDashboard.deuce);
    aDashboard.gameA();
    var arr = new List.filled(5, 0, growable: true);
    print(arr);
  });

}
