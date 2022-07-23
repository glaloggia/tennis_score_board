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
}
