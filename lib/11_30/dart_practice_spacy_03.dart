import 'dart:io';

void main(){
  int damage, health = 0;

  print('Hero VS Slime\n');
  stdout.write('Input Hero Information : Health, Attack, Defense : ');
  List<int> heroInfo = inputParameters();
  stdout.write('Input Slime Information : Health, Attack, Defense : ');
  List<int> slimeInfo = inputParameters();

  print('Start Hero Info : $heroInfo');
  print('Start Slime Info : $slimeInfo\n');

  while(true){
    damage = slimeInfo[1] - heroInfo[2];
    health = heroInfo[0] - damage;
    heroInfo[0] = health > 0 ? health : 0;
    print('Slime attacks! Hero takes $damage damage');

    damage = heroInfo[1] - slimeInfo[2];
    health = slimeInfo[0] - damage;
    slimeInfo[0] = health > 0 ? health : 0;
    print('Hero attacks! Slime takes $damage damage');

    if(heroInfo[0] <= 0){
      print("\nHero is defeated! Slime Wins!");
      break;
    } else if(slimeInfo[0] <= 0){
      print("\nSlime is defeated! Hero Wins!");
      break;
    }
  }

  print('\nFinal Hero Info : $heroInfo');
  print('Final Slime Info : $slimeInfo');

}


List<int> inputParameters() {
  List<int>? intList = [];

  String? oneLine = stdin.readLineSync();
  List<String> strList = oneLine!.trim().split(' ').toList();

  for (String str in strList) {
    intList.add(int.parse(str));
  }

  return intList;
}