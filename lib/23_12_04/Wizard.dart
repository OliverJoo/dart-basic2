class Wizard{
  String name;
  int hp;
  Wand? wand;

}

class Wand{
  String name;
  double power;

  Wand({
    required this.name,
    required this.power,
  });
}