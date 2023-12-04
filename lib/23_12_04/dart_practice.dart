// 연습문제 2-1
// 정보를 저장하기 좋은 컬렉션을 List, Set, Map 중 고르시오
// 대한민국의 도시 이름 모음 (순서 상관 없음) : Set
// 10명 학생의 시험 점수 : List
// 대한민국의 도시별 인구수 (순서 상관 없음) : Map

// 연습문제 2-2
class Person {
  String name;

  Person({required this.name});
}

void main() {
  final List<Person> personList = [];
  final person1 = Person(name: '홍길동');
  final person2 = Person(name: '한석봉');
  personList.add(person1);
  personList.add(person2);

  print('List에 담긴 모든 Person 인스턴스의 이름을 표시하기~');
  for (Person personInstance in personList) {
    print(personInstance.name); // 연습문제 2-2
  }

  final Map<String, dynamic> personInfo = {};
  personInfo[person1.name] = 20;
  personInfo[person2.name] = 25;

  print('\nMap에 저장한 값 출력하기~');
  personInfo.forEach((key, value) {
    print('$key의 나이는 $value살'); // 연습문제 2-3
  });
}
