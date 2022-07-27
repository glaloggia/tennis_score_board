import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_score_board/dashboard.dart';

void main() {
  test('Test 1: Deuce - True - Normal Path', () {
    var aDashboard = Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    expect(aDashboard.deuce, isTrue);
  });

  test('Test 2: Advantage A - True - Normal Path', () {
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

  test('Test 3: Advantage B - True - Normal Path', () {
    var aDashboard = Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    expect(aDashboard.advantageB, isTrue);
  });

  test('Test 4: Advantage A - False - Four points in a row', () {
    var aDashboard = Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    expect(aDashboard.advantageA, isFalse);
  });

  test('Test 5: Advantage B - False - Four points in a row', () {
    var aDashboard = Dashboard();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    expect(aDashboard.advantageB, isFalse);
  });

  test('Test 6: Deuce - False - Four points in a row', () {
    var aDashboard = Dashboard();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    expect(aDashboard.deuce, isFalse);
  });

  test('Test 7: Game A', () {
    var aDashboard = Dashboard();
    var testScoreboard = List.generate(
        5, (i) => List.filled(2, 0, growable: false),
        growable: false);
    testScoreboard[0] = [1, 0];
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    aDashboard.pointA();
    expect(aDashboard.scoreBoard, testScoreboard);
  });

  test('Test 8: Game B', () {
    var aDashboard = Dashboard();
    var testScoreboard = List.generate(
        5, (i) => List.filled(2, 0, growable: false),
        growable: false);
    testScoreboard[0] = [0, 1];
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    aDashboard.pointB();
    expect(aDashboard.scoreBoard, testScoreboard);
  });

  test('Test 9: 1 Set + 1 game', () {
    var aDashboard = Dashboard();
    var testScoreboard = List.generate(
        5, (i) => List.filled(2, 0, growable: false),
        growable: false);
    testScoreboard[1] = [1, 0];
    testScoreboard[0] = [6, 0];

    for (var i = 0; i < 28; i++) {
      aDashboard.pointA();
    }
    expect(aDashboard.scoreBoard, testScoreboard);
  });
}
