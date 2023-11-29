class IronMan {
  String name;
  int powerLevel;

  IronMan(this.name, this.powerLevel);

  void shoot() {
    print('$name is shooting guns!');
  }
}

class IronManMK3 extends IronMan {
//MK3는 리펄서를 쏘고 하늘을 날수 있게 해보세요
//shoot() 메서드를 오버라이드 합니다.
//비행고도 값을 추가한뒤
//fly() 메서드를 추가하세요

  int? flyheight;

  IronManMK3(String name, int powerLevel, this.flyheight)
      : super(name, powerLevel);

  @override
  void shoot() {
    print('$name is shooting Laser!');
  }

  void fly() {
    print('$name is flying in $flyheight');
  }
}

void main() {
  IronMan mk1 = IronMan("mk1", 10);

  IronManMK3 mk3 = IronManMK3("mk3", 20, 1000);

  mk1.shoot();

  mk3.shoot();
  mk3.fly();
}
