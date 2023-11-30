import 'dart:math';

class Cleric {
  String name;
  int hp;
  final int maxHp = 50;
  int mp;
  final int maxMp = 10;

  Cleric(this.name, this.hp, this.mp);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('Not enough MP! do pray~');
    }
  }

  int pray(int sec) {
    int recoverMp = sec + Random().nextInt(3);

    if (mp + recoverMp > maxMp) {
      mp = maxMp;
      recoverMp = 0;
    } else{
      mp += recoverMp;
    }

    return recoverMp;
  }

  void printStatus() {
    print('Cleric Name : $name, HP : $hp, MP : $mp ');
  }
}

void main() {
  final cleric = new Cleric('test', 30, 10);
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
