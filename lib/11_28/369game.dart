/*

Total Players Number : 4
Print Rules
  1) 30 fold numbers : ahh
  2) 3 fold numbers : clap
  3) 10 fold number : rool
  4) others print just number
Number Range : 1 ~ 100

Results
  Total counting of clap, rool, ahh
  Most clapped player

 */
void main() {
  int number = 99;
  List<String>? players = [];
  List<int> playerClaps = [0, 0, 0, 0];
  int clapCnt = 0;
  int roolCnt = 0;
  int ahhCnt = 0;

  for (int i = 1; i <= number; i++) {
    List<String> strList = (i.toString()).split('');
    String result = '';

    for (String str in strList) {
      int intStr = int.parse(str);
      // 369 Game clap
      result = (intStr % 3 == 0 && intStr != 0) ? 'clap' : '';

      // for the real 369 Game (for the double or triple claps)
      // result += (intStr % 3 == 0 && intStr != 0) ? 'clap ' : '';
    }

    // 30 & 10 fold number filter
    result = (i % 30 == 0) ? 'ahh' : (i % 10 == 0) ? 'rool' : result;

    players.add(result == '' ? i.toString() : result);
  }

  // to print 369 Game
  for (int i = 0; i < players.length; i++) {
    print('Palyer ${i % 4 + 1} : ${players[i]}');
    // counting
    switch (players[i]) {
      case 'clap':
        clapCnt += 1;
        playerClaps[i % 4] += 1;
        break;
      case 'rool':
        roolCnt += 1;
        break;
      case 'ahh':
        ahhCnt += 1;
        break;
    }
  }

  // find Max Number
  int numb = 0;
  for (int player in playerClaps) {
    if (numb < player) {
      numb = player;
    }
  }

  print('\nclap count: $clapCnt, rool count: $roolCnt, ahh count: $ahhCnt');
  print('Most clapped player: Player # ${playerClaps.indexOf(numb) + 1}');
}
