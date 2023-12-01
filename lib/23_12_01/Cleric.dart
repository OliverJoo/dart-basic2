import 'dart:math';

// 성직자는 이름과 HP를 가지고 있고, 추가로 마법을 사용하기 위한 MP를 가지고 있다.
// 또한 HP와 최대 HP는 정수로 초기치 50, MP와 최대 MP는 정수로 초기치 10으로 하고,
// 최대 HP와 최대 MP는 상수 필드로 선언 하시오.
class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp;
  int mp;

  Cleric(this.name, {this.hp = maxHp, this.mp = maxMp});

  // selfAid 라는 마법을 사용할 수 있고, MP를 5소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다
  // 또한, 이 메소드는 인수가 없고, 리턴 값도 없다.
  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
    } else {
      print('Not enough MP! do pray~');
    }
  }

  // pray 메소드는 인수에 “기도할 시간(초)"를 지정할 수 있고, 리턴 값은 “실제로 회복된 MP 양" 을 반환
  // 회복량은 기도한 시간(초)에 랜덤하게 0 ~ 2포인트의 보정을 한 양이다 (3초 기도하면 회복량은 3 ~ 5 포인트).
  // 단, 최대 MP 보다 더 회복하는 것은 불가능 하다.
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

  // 테스트 목적의 함수
  void printStatus() {
    print('Cleric Name : $name, HP : $hp, MP : $mp ');
  }
}
