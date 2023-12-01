import 'dart:math';

class Cleric {
  static final int maxHp = 50;
  static final int maxMp = 10;

  String? name;
  int hp = maxHp;
  int mp = maxMp;

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
