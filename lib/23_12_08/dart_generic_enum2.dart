int keyUsingCnt = 0;

enum KeyType {
  padlock(maxCnt: 1024),
  button(maxCnt: 10000),
  dial(maxCnt: 30000),
  finger(maxCnt: 100000);

  final int maxCnt;

  const KeyType({required this.maxCnt});
}

class StrongBox<E extends KeyType> {
  KeyType _keyKind;

  StrongBox({required KeyType keyKind}) : _keyKind = keyKind;

  void put(KeyType keyKind) => _keyKind = keyKind;

  KeyType? get() {
    keyUsingCnt ++;
    // enum 타입의 키 종류에 따른 분류
    switch (_keyKind) {
      case KeyType.padlock:
        // enum 키 종류의 시도 제한 횟수 미달시 null, 초과시 키종류 리턴
        return (keyUsingCnt > KeyType.padlock.maxCnt) ? _keyKind : null;
      case KeyType.button:
        return (keyUsingCnt > KeyType.button.maxCnt) ? _keyKind : null;
      case KeyType.dial:
        return (keyUsingCnt > KeyType.dial.maxCnt) ? _keyKind : null;
      case KeyType.finger:
        return (keyUsingCnt > KeyType.finger.maxCnt) ? _keyKind : null;
    }
  }
}

void main() {

  // enum 타입을 순환하며 unlock 시도!
  for (KeyType value in KeyType.values) {
    var strongBox = StrongBox<KeyType>(keyKind: value);

    for (int i = 0; i < 100004; i++) {
      if (strongBox.get() != null) {
        print('Unlocked by ${strongBox.get()}! ${keyUsingCnt - 1}th trying');
        keyUsingCnt = 0;
        break;
      }
    }
  }
}
