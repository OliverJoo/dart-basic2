// 연습문제 12-2
// 가
abstract class Asset {
  String name;
  int price;

  Asset({
    required this.name,
    required this.price,
  });
}

abstract interface class Thing {
  set weight(double weight);

  double get weight;
}

// 나
abstract class IntangibleAsset extends Asset {
  String right; // 무형자산의 특허명

  IntangibleAsset(
      {required this.right, required super.name, required super.price});
}

// 다
class Patent extends IntangibleAsset {
  int rightPeriod; // 무형자산 특허 기간

  Patent(
      {required this.rightPeriod,
      required super.right,
      required super.name,
      required super.price});
}

abstract class TangibleAsset extends Asset implements Thing {
  double _weight;

  TangibleAsset({
    required super.name,
    required double weight,
    required super.price,
  }) : _weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double weight) {
    _weight = weight;
  }
}

class Book extends TangibleAsset {
  String color;
  String isbn;

  Book({
    required this.color,
    required this.isbn,
    required super.name,
    required super.price,
    required super.weight,
  });
}

class Computer extends TangibleAsset {
  String color;
  String makerName;

  Computer({
    required this.color,
    required this.makerName,
    required super.name,
    required super.price,
    required super.weight,
  });
}
