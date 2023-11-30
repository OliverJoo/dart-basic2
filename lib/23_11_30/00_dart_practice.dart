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
    mp += sec + Random().nextInt(3);

    if (mp > maxMp) {
      mp = maxMp;
    }

    return mp;
  }

  void printStatus() {
    print('Cleric Name : $name, HP : $hp, MP : $mp ');
  }
}

void main() {
  final cleric = new Cleric('test', 30, 10);
  cleric.printStatus();
  print('After pray current MP : ${cleric.pray(4)}');
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  print('After pray current MP : ${cleric.pray(5)}');
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
  print('After pray current MP : ${cleric.pray(3)}');
  cleric.printStatus();
  print('After pray current MP : ${cleric.pray(3)}');
  cleric.selfAid();
  cleric.printStatus();
  cleric.selfAid();
}