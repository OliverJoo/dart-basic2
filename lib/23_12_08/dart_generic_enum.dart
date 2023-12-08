int keyUsingCnt = 0;

enum KeyType { padlock, button, dial, finger }

class StrongBox<E extends KeyType> {
  KeyType _keyKind;

  StrongBox({required KeyType keyKind}) : _keyKind = keyKind;

  void put(KeyType keyKind) => _keyKind = keyKind;

  KeyType? get() {
    keyUsingCnt++;
    switch (_keyKind) {
      case KeyType.padlock:
        if (keyUsingCnt < 1024) {
          return null;
        }
        break;
      case KeyType.button:
        if (keyUsingCnt < 10000) {
          return null;
        }
        break;
      case KeyType.dial:
        if (keyUsingCnt < 30000) {
          return null;
        }
        break;
      case KeyType.finger:
        if (keyUsingCnt < 1000000) {
          return null;
        }
        break;
    }
    return _keyKind;
  }
}

void main() {
  // final strongBox = StrongBox<KeyType>(keyKind: KeyType.padlock);
  final strongBox = StrongBox<KeyType>(keyKind: KeyType.finger);

  for (int i = 0; i < 1000004; i++) {
    if (strongBox.get() != null) {
      print('Unlocked by ${strongBox.get()}! ${i + 1}th trying');
    }
  }
}
