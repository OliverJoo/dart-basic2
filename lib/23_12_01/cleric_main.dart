import 'package:untitled/23_12_01/Cleric.dart';

void main() {
  // A: Cleric(“아서스", hp: 40, mp: 5) 처럼 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
  final cleric = Cleric('아서스', hp: 40, mp: 5);
  // B: Cleric(“아서스", hp: 35) 처럼, 이름과 HP만으로 지정하여 인스턴스화 가능.
  // 이 때, MP는 최대 MP와 같은 값이 초기화 된다
  final cleric1 = Cleric('아서스', hp: 35); // B
  // C: Cleric(“아서스") 처럼, 이름만 지정하여 인스턴스화 가능. 이때, HP와 MP는 각각 최대치로 초기화
  final cleric2 = Cleric('아서스');
  // D: Cleric() 과 같이 이름을 지정하지 않는 경우에는 인스턴스화 할 수 없다
  // final cleric3 = Cleric();

  cleric.printStatus();
  cleric1.printStatus();
  cleric2.printStatus();

  final test2 = const [];
  var test1 = const [];

  // cleric.printStatus();
  // print('Recovered MP : ${cleric.pray(4)}');
  // cleric.printStatus();
  // cleric.selfAid();
  // cleric.printStatus();
  // cleric.selfAid();
  // cleric.printStatus();
  // cleric.selfAid();
  // cleric.printStatus();
  // print('Recovered MP : ${cleric.pray(5)}');
  // cleric.printStatus();
  // cleric.selfAid();
  // cleric.printStatus();
  // cleric.selfAid();
  // cleric.printStatus();
  // cleric.selfAid();
  // print('Recovered MP : ${cleric.pray(3)}');
  // cleric.printStatus();
  // print('Recovered MP : ${cleric.pray(3)}');
  // cleric.selfAid();
  // cleric.printStatus();
  // cleric.selfAid();
  // print('Recovered MP : ${cleric.pray(3)}');
  // cleric.printStatus();
  // cleric.selfAid();
  // cleric.printStatus();
}
