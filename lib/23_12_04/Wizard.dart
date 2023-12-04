class Wizard {
  String name;
  int _hp;
  int _mp;
  Wand _wand;

  Wizard({
    required this.name,
    required int hp,
    required int mp,
    required Wand? wand,
  })  : _hp = (hp < 0) ? 0 : 0, // hp 가 0 이하면 0으로 설정
        _mp = mp,
        _wand = wand!,
        assert(mp >= 0 && wand != null); // mp는 0 이상이어야 하고 지팡이는 not null

  // 3. 마법사의 지팡이는 null 일 수 없다
  void set wand(Wand? wand) {
    if (wand == null) {
      throw Exception('마법사는 지팡이 필수!');
    }
    _wand = wand;
  }

  // 4. 마법사의 MP는 0 이상이어야 한다.
  void set mp(int value) {
    if (value < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 합니다');
    } else {
      _mp = value;
    }
  }

  // 5. HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다. (에러 아님)
  void set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  @override
  String toString() {
    return 'Wizard{name: $name, _hp: $_hp, _mp: $_mp, _wand: $_wand}';
  }
}

class Wand {
  String _name;
  double _power;

  Wand({required String? name, required double power})
      : _name = name!,
        _power = power,
        assert(name != null && // 이름은 null 일수 없으며
            name.length >= 3 && // 이름의 최소 길이는 3
            power >= 0.5 &&
            power <= 100.0); // 마력은 0.5 이상 100.0 이하

  // 1. 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상
  void set name(String? name) {
    if (name == null || name.length < 3) {
      throw Exception('이름은 null일 수 없고, 최소한 3글자 이상이어야 합니다.');
    }
    _name = name;
  }

  // 2. 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
  void set power(double value) {
    if (value >= 0.5 && value <= 100.0) {
      _power = value;
    } else {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하만 가능합니다.');
    }
  }

  @override
  String toString() {
    return 'Wand{_name: $_name, _power: $_power}';
  }
}

void main() {
  final wand = Wand(name: '완드1', power: 100);
  wand.power = 0.5;
  wand.name = '완드2';

  final wizard = Wizard(name: '위자드1', hp: -11, mp: 2, wand: wand);
  wizard.hp = -2;
  // wizard.mp = -1;
  // wizard.wand = null;
  print(wizard.toString());
}
