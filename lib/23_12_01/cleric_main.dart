import 'package:untitled/23_12_01/Cleric.dart';

void main() {
  // A: 이 클래스는 Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
  final cleric = Cleric('아서스', hp: 40, mp: 5);
  // B: 이 클래스는 Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다. 이 때, MP는 최대 MP와 같은 값이 초기화 된다
  final cleric1 = Cleric('아서스', hp: 35); // B
  // C: 이 클래스는 Cleric(“아서스") 와 같이 이름만을 지정하여 인스턴스화 할 수 있다. 이 때, HP 와 MP 는 최대 HP와 최대 MP로 초기화 된다
  final cleric2 = Cleric('아서스');
  // D: 이 클래스는 Cleric() 과 같이 이름을 지정하지 않는 경우에는 인스턴스화 할 수 없다고 한다. (이름이 없는 성직자는 존재 할 수 없음)
  // final cleric3 = Cleric();

  cleric.printStatus();
  cleric1.printStatus();
  cleric2.printStatus();

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
