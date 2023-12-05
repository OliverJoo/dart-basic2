final String nameValidation = '이름은 필수이고, 이름의 최소 길이는 3글자 이상입니다!';
final String wandValidation = '지팡이는 필수입니다';
final String wandPowerValidation = '지팡이의 마력은 0.5 이상 100.0 이하로 입력해주세요';
final String wizardMpValidation = '마법사의 MP는 0 이상이어야 합니다.';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand _wand;

  Wizard({
    required String name,
    required int hp,
    required int mp,
    required Wand wand,
  })  : _name = name,
        _hp = (hp < 0) ? 0 : hp, // hp 가 0 이하면 0으로 설정
        _mp = mp,
        _wand = wand,
        assert(name.length >= 3, nameValidation),
        assert(mp >= 0, wizardMpValidation);
        // assert(wand != null, wandValidation);

  set name(String? name) {
    if (name == null || name.length < 3) {
      throw Exception(nameValidation);
    }
    _name = name;
  }

  // 3. 마법사의 지팡이는 null 일 수 없다
  set wand(Wand? wand) {
    if (wand == null) {
      throw Exception(wandValidation);
    }
    _wand = wand;
  }

  // 4. 마법사의 MP는 0 이상이어야 한다.
  set mp(int value) {
    if (value < 0) {
      throw Exception(wizardMpValidation);
    } else {
      _mp = value;
    }
  }

  // 5. HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다. (에러 아님)
  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  @override
  String toString() {
    return 'Wizard{name: $_name, _hp: $_hp, _mp: $_mp, _wand: $_wand}';
  }
}

class Wand {
  String _name;
  double _power;

  Wand({required String name, required double power})
      : _name = name,
        _power = power,
        assert(name.length >= 3, nameValidation),
        assert(power >= 0.5 && power <= 100.0, wandPowerValidation);

  // 1. 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상
  set name(String? name) {
    if (name == null || name.length < 3) {
      throw Exception(nameValidation);
    }
    _name = name;
  }

  // 2. 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
  set power(double value) {
    if (value >= 0.5 && value <= 100.0) {
      _power = value;
    } else {
      throw Exception(wandPowerValidation);
    }
  }

  @override
  String toString() {
    return 'Wand{_name: $_name, _power: $_power}';
  }
}

void main() {
  final wand = Wand(name: "완21", power: 100);
  // wand.power = 0.5;
  // wand.name = '완드1';
  // print(wand.toString());

  final wizard = Wizard(name: "마법사", hp: -11, mp: 2, wand: wand);
  // wizard.hp = 20;
  // wizard.mp = -1;
  // wizard.wand = null;

  print(wizard.toString());
}
