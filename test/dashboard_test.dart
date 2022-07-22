import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_score_board/dashboard.dart';

void main(){

  test('Test: Deuce True', () {

    var aDashboard = Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    expect(aDashboard.deuce,isTrue);
  });

  test('Test: Advantage A',(){
    var aDashboard = Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointA();
    expect(aDashboard.advantageA, isTrue);
  });

  test('Test: Advantage - Four points in a row',(){
    var aDashboard = Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    expect(aDashboard.advantageA, isFalse);
  });

  test('Test: Deuce - Four points in a row',(){
    var aDashboard = Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    expect(aDashboard.advantageA, isFalse);
  });

}
