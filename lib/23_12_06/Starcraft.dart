// 미완성

// 스타크래프트에는 Terran, Zerg, Protoss 세 종족이 있습니다.
// Terran 은 인간 종족이고 생물(Bionic) 유닛인 Marine, Medic 등과 기계 유닛(Mechanic)인 Tank, Vulture, SCV 등이 있습니다.
// SCV는 일꾼 유닛으로 자원을 채취할 수 있으며, 기계 유닛의 수리를 할 수 있습니다.
// Medic은 생물유닛과 SCV 를 치료할 수 있습니다.

// 객체 - Terran, Zerg, Protoss, 인간종족, Bionic(Marine, Medic 포함), Mechanic(Tank, Vulture, SCV 포함)
// Terran 행동/기능 - SCV - 자원 채취, 기계유닛 수리
//                 - Medic - 생물유닉치료, SCV치료, Zerg종족에서 건물이 아닌 유닛을 치료할 수 있다.

// Terran은 인간종족이다. 
// 생물유닛과 기계유닛은 Terran이다.
// Marine과 Medic은 생물유닛이다.
// Tank, Vulture, SCV은 기계유닛이다.
////////////////////////////////////////////////////////////////////////////////

//Zerg 종족은 모든 유닛과 건물이 생물로 구성되어 있습니다.
// 저그 종족의 모든 유닛과 건물은 피해를 입어도 시간이 지나면 자동으로 조금씩 회복되는 능력을 가지고 있습니다.
// 하지만 테란의 Medic이 건물은 치료할 수 없습니다.

// 객체 - Zerg 종족은 전부 Bionic 이다.
// Zerg 행동?기능 특성 - 피해를 입어도 시간이 지남에 따라 회복능력을 갖고 있다.
//                     테란의 메딕은 건물이 아닌 Zerg 유닛을 치료할 수 있다.

////////////////////////////////////////////////////////////////////////////////
// 프로토스 종족은 외계 종족으로 Zealot, Dragun 등의 유닛으로 구성되어 있습니다.
// 프로토스 종족은 모든 유닛과 건물에 어느 정도의 방어막이 있습니다.
// 방어막은 가만히 있으면 서서히 회복합니다.
// Zealot은 생물 유닛이고 Dragun은 기계 유닛입니다.

// 프로토스 종족은 외계 종족이다.
// Zealot, Dragun 은 프로토스 이다.

// 동일 종족의 모든 유닛은 총 12개까지 하나의 그룹으로 부대 지정이 가능합니다.
//   List<Unit> corp = List(12);
////////////////////////////////////////////////////////////////////////////////


abstract class Race {
  String name;
  String hp;

  Race({
    required this.name,
    required this.hp,
  });

}

abstract class Terran extends Race {
  Terran({required super.name, required super.hp});

}

abstract class Zerg extends Race implements Bionic, Recoverable {
  int hpRecoveryAmount;

  Zerg({required super.name, required super.hp, this.hpRecoveryAmount = 3});

  @override
  void recovery() {
    print('recovery HP + $hpRecoveryAmount');
  }

}

abstract class Protoss extends Race implements Recoverable {
  int shieldRecoveryAmount;

  Protoss(
      {required super.name, required super.hp, this.shieldRecoveryAmount = 2});

  @override
  void recovery() {
    print('recovery HP + $shieldRecoveryAmount');
  }
}

abstract interface class Machine {
  bool isMachine();
}

abstract interface class Bionic {
}

abstract interface class Unit {
  void move();
}

abstract interface class Worker {
  void work();
}

abstract interface class Building {
}

abstract interface class Healable {}

abstract interface class Repairable {
}

abstract interface class Recoverable {
  void recovery();
}

abstract interface class Attackable {
  void attack();
}

class Marine extends Terran implements Bionic, Unit, Attackable {
  bool alive = true;
  int attackDamage;

  Marine({required super.name, required super.hp, this.attackDamage = 5});

  void attack() {
    print('attack');
  }

  @override
  void move() {
    print('move');
  }
}

class Medic extends Terran implements Bionic, Unit {
  int healPower;

  Medic({required super.name, required super.hp, this.healPower = 5});

  void heal(Healable healable) {
    print('heal! HP + $healPower');
  }

  @override
  void move() {
    print('move!');
  }
}

class Tank extends Terran implements Machine, Unit, Attackable {
  int damage;
  bool isSiege = false;
  bool moveable = true;

  Tank({required super.name, required super.hp, this.damage = 15});

  @override
  bool isMachine() {
    return true;
  }

  @override
  void move() {
    print('move!');
  }

  void siegeModeChange() {
    moveable = moveable == false ? true : false;
  }

  @override
  void attack() {
    // TODO: implement attack
    if (isSiege) {
      print('Attack! ${damage * 1.2}');
    } else {
      print('Attack! $damage');
    }
  }

}

class Vulture extends Terran implements Machine, Unit, Attackable {

  int damage;

  Vulture({required super.name, required super.hp, this.damage = 10});

  @override
  bool isMachine() {
    return true;
  }

  @override
  void move() {
    print('move!');
  }

  @override
  void attack() {
    print('attack! $damage');
  }

}

class SCV extends Terran implements Machine, Unit, Worker, Attackable {
  int damage;
  int miningAmount;
  int repairPower;

  SCV(
      {required super.name, required super.hp, this.damage = 3, this.miningAmount = 5, this.repairPower = 3});

  int mining(Resource resource) {
    return resource.depositAmount -= miningAmount;
  }

  int repair(Repairable repairable) {
    return repairPower;
  }

  @override
  void attack() {
    print('Attack! $damage');
  }

  @override
  bool isMachine() {
    return true;
  }

  @override
  void move() {
    print('move!');
  }

  @override
  void work() {
    print('mining!');
  }
}

class Resource {
  int depositAmount = 1000;
}

class CommandCenter extends Terran implements Building, Machine {
  CommandCenter({required super.name, required super.hp});

  @override
  bool isMachine() {
    return true;
  }

}

class Hive extends Zerg implements Building {
  Hive({required super.name, required super.hp});

}

class Hydra extends Zerg implements Unit, Attackable{
  Hydra({required super.name, required super.hp});

  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
  }

}

class Drone extends Zerg implements Unit, Attackable, Worker{
  Drone({required super.name, required super.hp});

  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
  }

  @override
  void work() {
    // TODO: implement work
  }

}

class Zergling extends Zerg implements Unit, Attackable{
  Zergling({required super.name, required super.hp});

  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
  }

}

class Zealot extends Protoss implements Bionic, Unit, Attackable{
  Zealot({required super.name, required super.hp});

  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
  }

}

class Dragun extends Protoss implements Machine, Unit, Attackable{
  Dragun({required super.name, required super.hp});

  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  bool isMachine() {
    // TODO: implement isMachine
    throw UnimplementedError();
  }

  @override
  void move() {
    // TODO: implement move
  }

}

class Nexsus extends Protoss implements Machine, Building, Attackable{
  Nexsus({required super.name, required super.hp});

  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  bool isMachine() {
    // TODO: implement isMachine
    throw UnimplementedError();
  }

}