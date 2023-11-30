void main(){
  var person1 = Person('John Doe', 30);
  var person2 = Person('Tester', 25);
  person1.printInfo();
  person2.printInfo();
}

// Person 클래스
class Person{
  var name; // 멤버변수
  var age;

  // 생성자
  Person(this.name, this.age);

  // 멤버 함수
  void printInfo(){
    print('name : $name, age : $age');
  }
}