import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('Not enough MP! do pray~');
    }
  }

  int pray(int sec) {
    if (sec <= 0) {
      print("0 second pray isn't pray!");
      return 0;
    }

    int recoveredMp = sec + Random().nextInt(3);

    if (mp + recoveredMp > maxHp) {
      mp = maxHp;
      recoveredMp = 0;
    } else {
      mp += recoveredMp;
    }

    return recoveredMp;
  }

  void printStatus() {
    print('Cleric Name : $name, HP : $hp, MP : $mp ');
  }
}
