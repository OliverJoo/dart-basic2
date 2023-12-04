void main() {
  final Set<int> lottoSet = {1, 2, 4, 6, 8, 43};

  print(lottoSet.contains(3));
  print(lottoSet.contains(43));

  final iterator = lottoSet.iterator;
  while (iterator.moveNext()) {
    print(iterator.current);
  }
  print(lottoSet.first);
  print(lottoSet.indexed);
  print(lottoSet);

  var indexedLottoSet = lottoSet.indexed.runtimeType;

  for (int numb in lottoSet) {
    print(numb);
  }

  // anti-pattern
  final numbers = [];
  final List<int> numbers2 = [];

  numbers.add(1);
  numbers.add("2");
  numbers.add(true);
  numbers.add(null);
  print(numbers);

  Object a = 10;
  print(a.runtimeType);
  // print(a + true); // 컴파일 시점 에러

  dynamic b = 10;
  print(a.runtimeType);
  print(b + true); // 런타임 시점 에러

  // right pattern
  final numbers3 = <int>[];
}
