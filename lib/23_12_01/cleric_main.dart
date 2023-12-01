import 'package:untitled/23_12_01/Cleric.dart';

void main() {
  final cleric = Cleric('아서스', hp: 40, mp: 5); // A
  final cleric1 = Cleric('아서스', hp: 35); // B
  final cleric2 = Cleric('아서스'); // C
  // final cleric3 = Cleric(); // D

  cleric.printStatus();
  print('Recovered MP : ${cleric.pray(4)}');
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  print('Recovered MP : ${cleric.pray(5)}');
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  print('Recovered MP : ${cleric.pray(3)}');
  cleric.printStatus();
  print('Recovered MP : ${cleric.pray(3)}');
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  print('Recovered MP : ${cleric.pray(3)}');
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
}
