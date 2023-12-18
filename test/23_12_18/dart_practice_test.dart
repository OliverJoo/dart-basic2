import 'dart:math';
import 'package:test/test.dart';
import 'package:untitled/23_12_18/dart_practice.dart';

void main() {
  test('홀짝 & 최대값 함수 테스트 정상 완료!', () {
    final testClass = TestClass();

    expect(testClass.isEven(4), true);
    expect(testClass.isEven(5), false);

    expect(testClass.findMax([1, 4, 5, 2, 42, 3]), 4);
    expect(testClass.findMax([1111, 234, 455, 2, 42, 3]), 1111);

    expect(testClass.reverseString('Hello'), 'olleH');
  });
}