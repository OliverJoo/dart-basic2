class Person {
  static const ethnic = 'ASIAN';
  String name;
  int age;

  Person(this.name, this.age);

  static String personIdentity() => ethnic;

  static int nextYearAge() {
    // return age + 1;
    return 0;
  }

}

void main() {
  print(Person.ethnic);
  final person = Person('Tester', 30);
  // person.ethnic;

  final test2 = const [];
  var test1 = const [];
}
