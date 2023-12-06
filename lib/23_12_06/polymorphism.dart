abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

void main() {
  X obj = A();
  // obj.a();
  // obj.b(); // 실행 불가
  // obj.c(); // 실행 불가

  Y y1 = A();
  Y y2 = B();
  // y1.a();
  // y2.a();

  A a1 = A();
  B b1 = B();


  List<Y> classList = [];
  classList.add(y1);
  classList.add(y2);
  classList.add(a1);
  classList.add(b1);

  classList.forEach((element) {
    element.b();
  });
}
