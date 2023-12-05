import 'dart:html';

class Person {
  String? name;
  int age;

  Person({
    this.name,
    required this.age,
  });
}

void main() {
  final person = Person(age: 25);

  // if (person.name != null) {
  //   print("안녕하세요, ${person.name}님!");
  // } else {
  //   print("이름이 없어요~");
  // }

  // if (person.name != null) {
  //   print("안녕하세요, ${person!.name}님!");
  // } else {
  //   print("이름이 없어요~");
  // }

  person.name = person.name ?? '테스터';
  print(person.name);

  var button = querySelector('#confirm');
  button?.text = 'Confirm';

}
