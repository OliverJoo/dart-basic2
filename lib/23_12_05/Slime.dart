// 영웅이나 슬라임의 생존 여부 체크 함수
bool isAlive(String name, int hp) {
  if (hp <= 0) {
    print('$name이 사망하여 아무것도 할 수 없습니다.');
    return false;
  }
  return true;
}

class Hero {
  String name;
  int hp;

  Hero(this.name, this.hp);

  void attack(Slime slime) {
    // 행위자 본인이 살아있는지 체크
    if (isAlive(name, hp)) {
      // 상대가 살아있는지 체크
      if (slime.hp <= 0) {
        print('슬라임${slime.suffix}는 이미 사망하였습니다.');
        return;
      }
      slime.hp -= 10;
      print(
          '$name이 슬라임${slime.suffix}을 공격했다. Damage : 10, 슬라임${slime.suffix} HP : ${slime.hp}');
    }
  }

  void run() {
    if (isAlive(name, hp)) {
      print('$name이 도망쳤다.');
    }
  }
}

class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    hero.hp -= 10;
    print(
        '슬라임$suffix이/가 공격했다. 10의 데미지. ${hero.name} HP: ${hero.hp <= 0 ? 0 : hero.hp}');
  }
}

// 독 공격이 가능한 슬라임 클래스
class PoisonSlime extends Slime {
  int posisonAttackCnt = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    // 행위자 본인이 살아있는지 체크
    if (isAlive('슬라임$suffix', hp)) {
      // 상대가 살아있는지 체크
      if (hero.hp <= 0) {
        print('${hero.name}는 이미 사망하였습니다.');
        return;
      }

      // TODO: implement attack
      super.attack(hero); // 보통 슬라임과 같은 공격

      // 독 공격 횟수가 남아있는가?
      if (posisonAttackCnt > 0) {
        int damage = (hero.hp.toDouble() * 0.25).toInt();

        // 영웅이 현재 자신의 hp보다 큰 데미지를 받았다면 현재hp만큼 데미지를 입는다.
        if (hero.hp <= damage) {
          damage = hero.hp;
          hero.hp = 0;
          print('${hero.name}이 사망하였습니다!');
          return;
        } else {
          hero.hp -= damage;
        }

        posisonAttackCnt -= 1;

        print('추가로, 독 포자를 살포했다!');
        print('$damage포인트의 데미지. ${hero.name} HP : ${hero.hp}');
      } else {
        print('독 공격 횟수가 남아있지 않아서 독 공격은 못했다!');
      }
    }
  }
}

void main() {
  PoisonSlime poisonSlime = PoisonSlime('A');
  final hero = Hero('홍길동', 50);

  while (poisonSlime.hp > 0 && hero.hp > 0) {
    hero.attack(poisonSlime);
    poisonSlime.attack(hero);
  }
}
