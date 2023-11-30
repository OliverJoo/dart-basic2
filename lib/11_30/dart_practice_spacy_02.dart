import 'dart:io';

void main() {
  String lackOfMoney ='돈이 부족해서 구매하실 수 없습니다.';
  String soldOut = '해당 물품은 매진되었습니다.';

  Map<String, int> vendingMachine = {
    '초콜릿 - 가격: 500원': 5,
    '빼빼로 - 가격: 600원': 5,
    '환타 - 가격: 1000원': 5,
    '사이다 - 가격: 1100원': 5
  };

  stdout.write('현재 가지고 계신 돈을 입력해주세요 :');
  int money = int.parse(stdin.readLineSync()!);

  while (money >= 500) {
    print('\n=== 자판기 상태 ====');
    for (String str in vendingMachine.keys) {
      print('$str, 수량 : ${vendingMachine[str]}개');
    }
    print('==================');

    stdout.write('구매할 상품 번호를 입력하세요. 1. 초콜릿, 2. 빼빼로, 3. 환타, 4. 사이다 : ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        if (money < 500) {
          print('$lackOfMoney\n');
        } else if (vendingMachine['초콜릿 - 가격: 500원']! == 0) {
          print('$soldOut\n');
        } else {
          money -= 500;
          vendingMachine['초콜릿 - 가격: 500원'] = vendingMachine['초콜릿 - 가격: 500원']! - 1;
          print('[초콜릿 구매 성공] 가격: 500원, 거스름돈: $money원, 남은수량: ${vendingMachine['초콜릿 - 가격: 500원']}개\n');
        }
        break;
      case 2:
        if (money < 600) {
          print('$lackOfMoney\n');
        } else if (vendingMachine['빼빼로 - 가격: 600원']! == 0) {
          print('$soldOut\n');
        } else {
          money -= 600;
          vendingMachine['빼빼로 - 가격: 600원'] = vendingMachine['빼빼로 - 가격: 600원']! - 1;
          print('[빼빼로 구매 성공] 가격: 600원, 거스름돈: $money원, 남은수량: ${vendingMachine['빼빼로 - 가격: 600원']}개\n');
        }
        break;
      case 3:
        if (money < 1000) {
          print('$lackOfMoney\n');
        } else if (vendingMachine['환타 - 가격: 1000원']! == 0) {
          print('$soldOut\n');
        } else {
          money -= 1000;
          vendingMachine['환타 - 가격: 1000원'] = vendingMachine['환타 - 가격: 1000원']! - 1;
          print('[환타 구매 성공] 가격: 500원, 거스름돈: $money원, 남은수량: ${vendingMachine['환타 - 가격: 1000원']}개\n');
        }
        break;
      case 4:
        if (money < 1100) {
          print('$lackOfMoney\n');
        } else if (vendingMachine['사이다 - 가격: 1100원']! == 0) {
          print('$soldOut\n');
        } else {
          money -= 1100;
          vendingMachine['사이다 - 가격: 1100원'] = vendingMachine['사이다 - 가격: 1100원']! - 1;
          print('[사이다 구매 성공] 가격: 500원, 거스름돈: $money원, 남은수량: ${vendingMachine['사이다 - 가격: 1100원']}개\n');
        }
        break;
      default :
        print('1~4까지의 숫자만 입력해주세요~');
    }
  }
}

